class SignUps::New < BrowserAction
  include Auth::RedirectIfSignedIn

  get "/sign_up" do
    html NewPage, operation: SignUpUser.new
  end
end
