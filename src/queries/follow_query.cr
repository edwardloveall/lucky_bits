class FollowQuery < Follow::BaseQuery
  def self.follow_requests(for user : User)
    new.follow_requests(for: user)
  end

  def follow_requests(for user : User)
    preload_from
      .where("accepted_at IS NULL")
      .to_id(user.id)
  end

  def self.followers(for user : User)
    new.followers(for: user)
  end

  def followers(for user : User)
    preload_from
      .where("accepted_at IS NOT NULL")
      .to_id(user.id)
  end

  def self.following(for user : User)
    new.following(for: user)
  end

  def following(for user : User)
    preload_to
      .where("accepted_at IS NOT NULL")
      .from_id(user.id)
  end

  def empty?
    size.zero?
  end
end
