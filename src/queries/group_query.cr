class GroupQuery < Group::BaseQuery
  def contains_user?(group_id : Int64, user_id : Int64)
    MembershipQuery.exists_for_group_and_user?(group_id, user_id).any?
  end
end
