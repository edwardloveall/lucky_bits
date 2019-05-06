class Follows::Update < BrowserAction
  route do
    follows = FollowQuery.follow_requests(for: current_user)
    follow = follows.id(params.get(:follow_id)).first
    FollowAcceptForm.update!(follow)
    flash.success = "#{follow.from.username} is now following you!"
    redirect Follows::Index
  end
end
