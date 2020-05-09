class BitQuery < Bit::BaseQuery
  def self.newest_first
    new.newest_first
  end

  def newest_first
    created_at.desc_order
  end

  def self.from(user : User)
    new.from(user)
  end

  def from(user : User)
    preload_user.user_id(user.id)
  end

  def self.from_group(
    group : Group,
    without_bits_from : UserLike = NullUser.new
  )
    new.from_group(group, without_bits_from)
  end

  def from_group(
    group : Group,
    without_bits_from user : UserLike = NullUser.new
  )
    preload_user.group_id(group.id).user_id.not.eq(user.id).newest_first
  end

  def self.for(user : User)
    new.for(user)
  end

  def for(user : User)
    preload_user
      .user_id.eq(user.id)
      .newest_first
  end
end
