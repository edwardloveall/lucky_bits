class Users::Follows::Create < BrowserAction
  nested_route do
    user = UserQuery.find(params.get(:user_id))
    FollowRequestDirectForm.create(
      current_user: current_user,
      to_user: user,
    ) do |form, follow|
      if follow
        flash.success = "Your invite has been sent for approval!"
        redirect Users::Show.with(user.id)
      else
        render Users::ShowPage, user: user
      end
    end
  end
end
