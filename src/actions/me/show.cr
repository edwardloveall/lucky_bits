class Me::Show < BrowserAction
  get "/me" do
    follow_requests = FollowQuery.follow_requests(for: current_user)
    followers = FollowQuery.followers(for: current_user)
    render ShowPage, follow_requests: follow_requests, followers: followers
  end
end
