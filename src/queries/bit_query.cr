class BitQuery < Bit::BaseQuery
  def self.recently_created
    new.recently_created
  end

  def recently_created
    created_at.desc_order
  end

  def self.from(user : User)
    new.from(user)
  end

  def from(user : User)
    preload_user.user_id(user.id)
  end

  def self.for_group(group : Group)
    new.for_group(group)
  end

  def for_group(group : Group)
    preload_user.group_id(group.id).recently_created
  end

  def self.for(user : User)
    new.for(user)
  end

  def for(user : User)
    preload_user
      .user_id.eq(user.id)
      .recently_created
  end
end
