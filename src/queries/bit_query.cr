class BitQuery < Bit::BaseQuery
  def self.recently_created
    new.recently_created
  end

  def recently_created
    created_at.desc_order
  end

  def for_user(user : User)
    user_id.not(user.id)
  end

  def self.followed(by user : User)
    new.followed(user)
  end

  def followed(by user : User)
    inner_join_follows
    preload_user.follows(&.from_id(user.id).where("accepted_at IS NOT NULL"))
  end
end
