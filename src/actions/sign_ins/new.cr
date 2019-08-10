class SignIns::New < BrowserAction
  include Auth::RedirectIfSignedIn

  get "/sign_in" do
    render NewPage, operation: SignInUser.new
  end
end
