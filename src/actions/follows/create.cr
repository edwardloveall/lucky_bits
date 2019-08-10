class Follows::Create < BrowserAction
  route do
    FollowRequestUsername.create(
      params: params,
      current_user: current_user
    ) do |operation, follow|
      if follow
        flash.success = "Your invite has been sent for approval!"
        redirect Follows::New
      else
        render Follows::NewPage, follow_request: operation
      end
    end
  end
end
