class Groups::Show < BrowserAction
  route do
    group = GroupQuery.new.preload_users.find(group_id)
    operation = GroupInvite.new
    html(
      Groups::ShowPage,
      group: group,
      group_invite: operation,
    )
  end
end
