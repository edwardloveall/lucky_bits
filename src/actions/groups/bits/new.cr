class Groups::Bits::New < BrowserAction
  param title : String = ""
  param url : String = ""

  nested_route do
    group = GroupQuery.find(group_id)
    html Groups::Bits::NewPage, save_bit: SaveBit.new(title: title, url: url), group: group
  end
end
