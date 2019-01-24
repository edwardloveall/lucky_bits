class Follows::Create < BrowserAction
  route do
    FollowRequestUsernameForm.create(
      params: params,
      current_user: current_user,
    ) do |form, follow|
      if follow
        flash.success = "Your invite has been sent for approval!"
        redirect Follows::New
      else
        render Follows::NewPage, follow_request_form: form
      end
    end
  end
end
