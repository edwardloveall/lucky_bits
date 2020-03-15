class GroupQuery < Group::BaseQuery
  def contains_user?(group_id : Int64 | Nil, user : User)
    if group_id
      id.eq(group_id).where_users(UserQuery.new.username.eq(user.username)).any?
    else
      false
    end
  end
end
