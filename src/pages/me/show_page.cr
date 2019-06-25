class Me::ShowPage < MainLayout
  needs form : PasswordResetForm

  def content
    h3 "#{@current_user.username}"

    render_password_reset_form(@form)
  end

  private def render_password_reset_form(form)
    form_for Users::UpdatePassword.with(@current_user.id) do
      field(form.password) { |i| password_input i, autofocus: "true" }
      field(form.password_confirmation) { |i| password_input i }

      submit "Update Password", flow_id: "update-password-button"
    end
  end
end
