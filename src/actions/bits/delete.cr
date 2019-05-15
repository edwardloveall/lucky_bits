class Bits::Delete < BrowserAction
  route do
    BitQuery.find(bit_id).delete
    flash.success = "Bit deleted."
    redirect Me::Show
  end
end
