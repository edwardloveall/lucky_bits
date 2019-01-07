class Bits::Index < BrowserAction
  route do
    render IndexPage, bits: BitQuery.followed(by: current_user)
  end
end
