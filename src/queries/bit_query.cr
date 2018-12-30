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
end
