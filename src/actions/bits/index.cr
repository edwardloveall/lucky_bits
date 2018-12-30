class Bits::Index < BrowserAction
  route do
    render IndexPage, bits: BitQuery.recently_created
  end
end
