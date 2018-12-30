class Bits::New < BrowserAction
  route do
    render Bits::NewPage, bit_form: BitForm.new
  end
end
