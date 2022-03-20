class Groups::Bits::Index < BrowserAction
  get "/groups/:group_id/bits" do
    group = GroupQuery.find(group_id)
    bits = BitQuery.from_group(group)

    if bits.empty?
      html Groups::Bits::IndexCoachPage, group: group
    else
      html Groups::Bits::IndexPage, group: group, bits: bits
    end
  end
end
