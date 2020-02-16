class Me::Show < BrowserAction
  get "/me" do
    html ShowPage, reset_password: ResetPassword.new
  end
end
