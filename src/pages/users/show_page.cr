class Users::ShowPage < MainLayout
  needs user : User

  def content
    h2 @user.email
    link(
      "Request to follow",
      to: Users::Follows::Create.with(user_id: @user.id),
      flow_id: "request-user-follow"
    )
  end
end
