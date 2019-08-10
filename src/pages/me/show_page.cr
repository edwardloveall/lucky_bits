class Me::ShowPage < MainLayout
  needs reset_password : ResetPassword

  def content
    h3 "#{@current_user.username}"

    render_password_reset_form(@reset_password)
  end

  private def render_password_reset_form(op)
    form_for Users::UpdatePassword.with(@current_user.id) do
      field(op.password) { |i| password_input i, autofocus: "true" }
      field(op.password_confirmation) { |i| password_input i }

      submit "Update Password", flow_id: "update-password-button"
    end
  end
end
