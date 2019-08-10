class PasswordResets::NewPage < GuestLayout
  needs reset_password : ResetPassword
  needs user_id : Int32

  def content
    h1 "Reset your password"
    render_password_reset_form(@reset_password)
  end

  private def render_password_reset_form(op)
    form_for PasswordResets::Create.with(@user_id) do
      field(op.password) { |i| password_input i, autofocus: "true" }
      field(op.password_confirmation) { |i| password_input i }

      submit "Update Password", flow_id: "update-password-button"
    end
  end
end
