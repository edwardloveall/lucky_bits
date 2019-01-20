class Users::Show < BrowserAction
  route do
    user = UserQuery.find(params.get(:id))
    render Users::ShowPage, user: user
  end
end
