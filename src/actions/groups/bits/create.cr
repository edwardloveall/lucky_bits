class Groups::Bits::Create < BrowserAction
  nested_route do
    group = GroupQuery.find(group_id)
    SaveBit.create(
      params,
      user_id: current_user.id,
      group_id: group.id
    ) do |operation, bit|
      if bit
        redirect to: Groups::Bits::Index.with(group)
      else
        html Groups::Bits::NewPage, save_bit: SaveBit.new(params), group: group
      end
    end
  end
end
