class Users::Show < BrowserAction
  route do
    user = UserQuery.find(params.get(:id))
    existing_follow_requests = FollowQuery.
      new.
      from_id(current_user.id).
      to_id(user.id)
    render(
      Users::ShowPage,
      user: user,
      existing_follow_requests: existing_follow_requests,
    )
  end
end