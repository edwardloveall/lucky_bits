class Me::Show < BrowserAction
  get "/me" do
    render ShowPage, bits: BitQuery.from(current_user)
  end
end
