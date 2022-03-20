class Bits::Edit < BrowserAction
  get "/bits/:bit_id/edit" do
    bit = BitQuery.find(bit_id)
    html Bits::EditPage, save_bit: SaveBit.new(bit), bit: bit
  end
end
