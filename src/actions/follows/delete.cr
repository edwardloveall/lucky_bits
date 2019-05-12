class Follows::Delete < BrowserAction
  route do
    follows = FollowQuery.follow_requests(for: current_user)
    follow = follows.id(params.get(:follow_id)).first
    follow.delete
    flash.success = "#{follow.from.username} has been denied."
    redirect Follows::Index
  end
end
