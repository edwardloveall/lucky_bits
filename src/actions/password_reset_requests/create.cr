class PasswordResetRequests::Create < BrowserAction
  include Auth::RedirectIfSignedIn

  route do
    ResetPasswordRequest.new(params).submit do |operation, user|
      if user
        PasswordResetRequestEmail.new(user).deliver
        flash.success = "You should receive an email on how to reset your password shortly"
        redirect SignIns::New
      else
        render NewPage, reset_password_request: operation
      end
    end
  end
end
