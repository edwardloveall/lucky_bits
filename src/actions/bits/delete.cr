class Bits::Delete < BrowserAction
  route do
    BitQuery.find(params.get(:bit_id)).delete
    flash.success = "Bit deleted."
    redirect Me::Show
  end
end
