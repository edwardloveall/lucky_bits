class Me::Show < BrowserAction
  get "/me" do
    render ShowPage, reset_password: ResetPassword.new
  end
end
