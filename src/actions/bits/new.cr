class Bits::New < BrowserAction
  route do
    render Bits::NewPage, save_bit: SaveBit.new
  end
end
