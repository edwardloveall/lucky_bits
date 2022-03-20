class Memberships::Create < BrowserAction
  param group_id : Group::PrimaryKeyType

  post "/memberships" do
    GroupInvite.create(params, group_id: group_id) do |operation, membership|
      if membership
        flash.success = "#{membership.user!.username} is now a member!"
        redirect Groups::Show.with(group_id)
      else
        group = GroupQuery.new.preload_users.find(group_id)
        html(
          Groups::ShowPage,
          group: group,
          group_invite: operation,
          group_bits: BitQuery.from_group(group),
        )
      end
    end
  end
end
