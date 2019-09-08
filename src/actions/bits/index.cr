class Bits::Index < BrowserAction
  route do
    render IndexPage, bits: BitQuery.for(current_user)
  end
end
