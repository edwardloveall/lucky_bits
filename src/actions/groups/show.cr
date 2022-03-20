class Groups::Show < BrowserAction
  get "/groups/:group_id" do
    group = GroupQuery.new.preload_users.find(group_id)
    operation = GroupInvite.new
    html(
      Groups::ShowPage,
      group: group,
      group_invite: operation,
    )
  end
end
