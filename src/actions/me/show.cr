class Me::Show < BrowserAction
  get "/me" do
    render ShowPage, bits: BitQuery.new.preload_user.user_id(current_user.id)
  end
end
