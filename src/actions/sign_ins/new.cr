class SignIns::New < BrowserAction
  include Auth::RedirectIfSignedIn

  get "/sign_in" do
    html NewPage, operation: SignInUser.new
  end
end
