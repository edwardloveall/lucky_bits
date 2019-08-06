class Groups::Show < BrowserAction
  route do
    group = GroupQuery.new.preload_users.find(group_id)
    form = GroupInviteForm.new
    render Groups::ShowPage, group: group, group_invite_form: form
  end
end
