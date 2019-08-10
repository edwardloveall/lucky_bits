class Groups::Show < BrowserAction
  route do
    group = GroupQuery.new.preload_users.find(group_id)
    render Groups::ShowPage, group: group
  end
end
