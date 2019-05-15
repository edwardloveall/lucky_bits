class Bits::Edit < BrowserAction
  route do
    bit = BitQuery.find(bit_id)
    render Bits::EditPage, bit_form: BitForm.new(bit), bit: bit
  end
end
