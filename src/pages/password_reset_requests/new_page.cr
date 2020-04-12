class PasswordResetRequests::NewPage < GuestLayout
  needs reset_password_request : ResetPasswordRequest

  def content
    h1 "Reset your password"
    render_form(reset_password_request)
  end

  private def render_form(op)
    form_for PasswordResetRequests::Create do
      field(op.email) { |i| email_input i }
      submit "Reset Password", flow_id: "request-password-reset-button"
    end
  end
end
