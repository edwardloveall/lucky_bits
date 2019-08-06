class Memberships::Create < BrowserAction
  param group_id : Int32

  route do
    GroupInviteForm.create(params, group_id: group_id) do |form, membership|
      if membership
        flash.success = "#{form.username} is now a member!"
        redirect Groups::Show.with(group_id)
      else
        group = GroupQuery.new.preload_users.find(1)
        render Groups::ShowPage, group: group, group_invite_form: form
      end
    end
  end
end
