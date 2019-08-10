class SignUps::New < BrowserAction
  include Auth::RedirectIfSignedIn

  get "/sign_up" do
    render NewPage, operation: SignUpUser.new
  end
end
