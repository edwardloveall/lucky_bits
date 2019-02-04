class Follows::Index < BrowserAction
  route do
    follow_requests = FollowQuery.follow_requests(for: current_user)
    followers = FollowQuery.followers(for: current_user)
    following = FollowQuery.following(for: current_user)
    recent_follows = FollowQuery.recent_follows(for: current_user)

    render(
      IndexPage,
      follow_requests: follow_requests,
      followers: followers,
      following: following,
      recent_follows: recent_follows
    )
  end
end
