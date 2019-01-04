class Follows::Update < BrowserAction
  route do
    follows = FollowQuery.follow_requests(for: current_user)
    follow = follows.id(params.get(:id)).first
    FollowAcceptForm.update!(follow)
    flash.success = "#{follow.from.email} is now following you!"
    redirect Me::Show
  end
end
