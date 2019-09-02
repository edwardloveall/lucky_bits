class Groups::Bits::Create < BrowserAction
  nested_route do
    group = GroupQuery.find(group_id)
    SaveBit.create(params, user_id: current_user.id) do |operation, bit|
      if bit
        redirect to: Users::Show.with(current_user)
      else
        render Groups::Bits::NewPage, save_bit: SaveBit.new, group: group
      end
    end
  end
end
