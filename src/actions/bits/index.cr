class Bits::Index < BrowserAction
  route do
    html IndexPage, bits: BitQuery.for(current_user)
  end
end
