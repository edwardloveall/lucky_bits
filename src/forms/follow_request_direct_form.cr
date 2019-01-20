class FollowRequestDirectForm < Follow::BaseForm
  needs current_user : User
  needs to_user : User

  def prepare
    from_id.value = current_user.id
    to_id.value = to_user.id
  end
end
