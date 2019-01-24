class Follows::New < BrowserAction
  route do
    form = FollowRequestUsernameForm.new(current_user: current_user)
    render Follows::NewPage, follow_request_form: form
  end
end
