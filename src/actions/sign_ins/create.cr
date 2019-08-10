class SignIns::Create < BrowserAction
  include Auth::RedirectIfSignedIn

  route do
    SignInUser.new(params).submit do |operation, authenticated_user|
      if authenticated_user
        sign_in(authenticated_user)
        flash.success = "You're now signed in"
        Authentic.redirect_to_originally_requested_path(self, fallback: Bits::Index)
      else
        flash.failure = "Sign in failed"
        render NewPage, operation: operation
      end
    end
  end
end
