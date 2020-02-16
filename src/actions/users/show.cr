class Users::Show < BrowserAction
  route do
    user = UserQuery.find(params.get(:user_id))
    html(
      Users::ShowPage,
      user: user,
      bits: BitQuery.from(current_user)
    )
  end
end
