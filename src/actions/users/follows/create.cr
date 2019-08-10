class Users::Follows::Create < BrowserAction
  nested_route do
    user = UserQuery.find(params.get(:user_id))
    FollowRequestDirect.create(
      current_user: current_user,
      to_user: user
    ) do |operation, follow|
      if follow
        flash.success = "Your invite has been sent for approval!"
        redirect Users::Show.with(user.id)
      else
        flash.failure = "Something went wrong with that follow request..."
        redirect Users::Show.with(user.id)
      end
    end
  end
end
