class Groups::Bits::Create < BrowserAction
  post "/groups/:group_id/bits" do
    group = GroupQuery.find(group_id)
    SaveBit.create(
      params,
      user_id: current_user.id,
      group_id: group.id
    ) do |operation, bit|
      if bit
        flash.success = "Bit created."
        redirect to: Groups::Bits::Index.with(group)
      else
        html Groups::Bits::NewPage, save_bit: operation, group: group
      end
    end
  end
end
