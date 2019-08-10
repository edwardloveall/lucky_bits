class Groups::Index < BrowserAction
  route do
    groups = GroupQuery.new
      .join_users
      .where_users(UserQuery.new.id(current_user.id))

    render Groups::IndexPage, groups: groups
  end
end
