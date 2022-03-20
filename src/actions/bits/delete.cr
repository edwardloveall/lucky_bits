class Bits::Delete < BrowserAction
  delete "/bits/:bit_id" do
    bit = BitQuery.find(bit_id)
    bit.delete
    flash.success = "Bit deleted."
    redirect Groups::Bits::Index.with(bit.group_id)
  end
end
