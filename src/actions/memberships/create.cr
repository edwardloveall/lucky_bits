class Memberships::Create < BrowserAction
  param group_id : Group::PrimaryKeyType

  route do
    GroupInvite.create(params, group_id: group_id) do |operation, membership|
      if membership
        flash.success = "#{operation.username} is now a member!"
        redirect Groups::Show.with(group_id)
      else
        group = GroupQuery.new.preload_users.find(1)
        html(
          Groups::ShowPage,
          group: group,
          group_invite: operation,
          group_bits: BitQuery.for_group(group),
        )
      end
    end
  end
end
