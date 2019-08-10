class PasswordResetRequests::New < BrowserAction
  include Auth::RedirectIfSignedIn

  route do
    render NewPage, reset_password_request: ResetPasswordRequest.new
  end
end
