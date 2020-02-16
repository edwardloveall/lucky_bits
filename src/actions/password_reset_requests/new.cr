class PasswordResetRequests::New < BrowserAction
  include Auth::RedirectIfSignedIn

  route do
    html NewPage, reset_password_request: ResetPasswordRequest.new
  end
end
