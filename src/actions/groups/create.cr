class Groups::Create < BrowserAction
  route do
    GroupForm.create(params: params) do |form, group|
      if group
        flash.success = "Group created!"
        MembershipForm.create!(group_id: group.id, user_id: current_user.id)
        redirect Groups::Index
      else
        render Groups::NewPage, group_form: form
      end
    end
  end
end
