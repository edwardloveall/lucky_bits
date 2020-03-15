class GroupQuery < Group::BaseQuery
  def contains_user?(group_id : Int64, user : User)
    id.eq(group_id).where_users(UserQuery.new.id.eq(user.id)).any?
  end
end
