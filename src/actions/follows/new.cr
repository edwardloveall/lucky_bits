class Follows::New < BrowserAction
  route do
    operation = FollowRequestUsername.new(current_user: current_user)
    render Follows::NewPage, follow_request: operation
  end
end
