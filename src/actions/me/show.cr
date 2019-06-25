class Me::Show < BrowserAction
  get "/me" do
    render ShowPage, form: PasswordResetForm.new
  end
end
