class Memberships::Create < BrowserAction
  param group_id : Group::PrimaryKeyType

  route do
    GroupInvite.create(params, group_id: group_id) do |operation, membership|
      if membership
        flash.success = "#{operation.username} is now a member!"
        redirect Groups::Show.with(group_id)
      else
        group = GroupQuery.new.preload_users.find(1)
        render Groups::ShowPage, group: group, group_invite: operation
      end
    end
  end
end
