class PasswordResetRequests::New < BrowserAction
  include Auth::RedirectIfSignedIn

  get "/password_reset_requests/new" do
    html NewPage, reset_password_request: ResetPasswordRequest.new
  end
end
