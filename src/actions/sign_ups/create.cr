class SignUps::Create < BrowserAction
  include Auth::RedirectIfSignedIn

  post "/sign_ups" do
    SignUpUser.create(params) do |operation, user|
      if user
        flash.info = "Thanks for signing up"
        sign_in(user)
        redirect to: Groups::Index
      else
        flash.info = "Couldn't sign you up"
        html NewPage, operation: operation
      end
    end
  end
end
