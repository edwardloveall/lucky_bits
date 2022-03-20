class PasswordResetRequests::Create < BrowserAction
  include Auth::RedirectIfSignedIn

  post "/password_reset_requests" do
    ResetPasswordRequest.run(params) do |operation, user|
      if user
        PasswordResetRequestEmail.new(user).deliver
        flash.success = "You should receive an email on how to reset your password shortly"
        redirect SignIns::New
      else
        html NewPage, reset_password_request: operation
      end
    end
  end
end
