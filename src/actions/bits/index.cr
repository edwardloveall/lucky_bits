class Bits::Index < BrowserAction
  get "/bits" do
    html IndexPage, bits: BitQuery.for(current_user)
  end
end
