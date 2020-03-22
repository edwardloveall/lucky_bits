class MembershipQuery < Membership::BaseQuery
  def self.exists_for_group_and_user?(group_id : Int64, user_id : Int64)
    new.group_id(group_id).user_id(user_id)
  end
end
