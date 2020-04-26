class Groups::Bits::Index < BrowserAction
  nested_route do
    group = GroupQuery.find(group_id)
    bits = BitQuery.new.for_group(group)

    if bits.empty?
      html Groups::Bits::IndexCoachPage, group: group
    else
      html Groups::Bits::IndexPage, group: group, bits: bits
    end
  end
end
