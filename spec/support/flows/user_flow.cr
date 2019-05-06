class UserFlow < AuthenticatedBaseFlow
  def visit_user_page(user : User)
    visit Users::Show.with(user.id)
  end

  def request_follow
    click "@request-user-follow"
  end
end
