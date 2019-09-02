class Groups::Bits::New < BrowserAction
  nested_route do
    group = GroupQuery.find(group_id)
    render Groups::Bits::NewPage, save_bit: SaveBit.new, group: group
  end
end
