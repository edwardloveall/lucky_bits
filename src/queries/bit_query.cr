class BitQuery < Bit::BaseQuery
  def for_user(user : User)
    user_id.not(user.id)
  end
end
