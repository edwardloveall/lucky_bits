class Bits::Edit < BrowserAction
  route do
    bit = BitQuery.find(bit_id)
    render Bits::EditPage, save_bit: SaveBit.new(bit), bit: bit
  end
end
