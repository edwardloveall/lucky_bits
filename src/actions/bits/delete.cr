class Bits::Delete < BrowserAction
  route do
    bit = BitQuery.find(bit_id)
    bit.delete
    flash.success = "Bit deleted."
    redirect Groups::Bits::Index.with(bit.group_id)
  end
end
