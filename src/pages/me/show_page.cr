class Me::ShowPage < MainLayout
  needs reset_password : ResetPassword

  private def page_title
    "Account"
  end

  def content
    h3 "#{current_user.username}'s account"
    page_description
    render_password_reset_form(reset_password)
  end

  private def render_password_reset_form(op)
    form_for Users::UpdatePassword.with(current_user.id) do
      field(op.password) { |i| password_input i, autofocus: "true" }
      field(op.password_confirmation) { |i| password_input i }

      submit "Update Password", flow_id: "update-password-button"
    end
  end

  private def page_description
    para do
      text "There's not much to do here yet. But you can reset your password if you like. "
      text "Use the navigation at the top look at your "
      strong "groups"
      text " or post a "
      strong "bit"
      text " to one of them."
    end
  end
end
