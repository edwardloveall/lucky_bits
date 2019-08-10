class UserFlow < AuthenticatedBaseFlow
  def visit_user_page(user : User)
    visit Users::Show.with(user.id)
  end

  def request_follow
    click "@request-user-follow"
  end

  def update_password(password : String)
    fill_form ResetPassword,
      password: password,
      password_confirmation: password
    click "@update-password-button"
  end
end
