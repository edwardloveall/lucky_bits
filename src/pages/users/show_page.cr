class Users::ShowPage < MainLayout
  needs user : User
  needs existing_follow_requests : FollowQuery

  def content
    h2 @user.email

    if @existing_follow_requests.try(&.empty?)
      link_to_follow(@user)
    else
      para "We're waiting on #{@user.email} to confirm your follow request."
    end
  end

  private def link_to_follow(user : User)
    link(
      "Request to follow",
      to: Users::Follows::Create.with(user_id: user.id),
      flow_id: "request-user-follow"
    )
  end
end
