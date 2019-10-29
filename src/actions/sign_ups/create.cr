class SignUps::Create < BrowserAction
  include Auth::RedirectIfSignedIn

  route do
    SignUpUser.create(params) do |operation, user|
      if user
        flash.info = "Thanks for signing up"
        sign_in(user)
        redirect to: Me::Show
      else
        flash.info = "Couldn't sign you up"
        render NewPage, operation: operation
      end
    end
  end
end
