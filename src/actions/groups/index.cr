class Groups::Index < BrowserAction
  get "/groups" do
    groups = GroupQuery.new
      .join_users
      .where_users(UserQuery.new.id(current_user.id))

    if groups.empty?
      html Groups::IndexCoachPage
    else
      html Groups::IndexPage, groups: groups
    end
  end
end
