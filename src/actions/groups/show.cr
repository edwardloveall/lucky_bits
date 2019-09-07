class Groups::Show < BrowserAction
  route do
    group = GroupQuery.new.preload_users.find(group_id)
    operation = GroupInvite.new
    bits = BitQuery.new.for_group(group)
    render(
      Groups::ShowPage,
      group: group,
      group_invite: operation,
      group_bits: bits,
    )
  end
end
