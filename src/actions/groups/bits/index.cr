class Groups::Bits::Index < BrowserAction
  nested_route do
    group = GroupQuery.find(group_id)
    bits = BitQuery.new.for_group(group)

    html Groups::Bits::IndexPage, group: group, bits: bits
  end
end
