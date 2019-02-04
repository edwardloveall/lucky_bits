class Follows::Create < BrowserAction
  route do
    FollowRequestUsernameForm.create(
      params: params,
      current_user: current_user,
    ) do |form, follow|
      if follow
        flash.success = "Your follow request has been sent to #{follow.to.username} for approval!"
        redirect Follows::New
      else
        render Follows::NewPage, follow_request_form: form
      end
    end
  end
end
