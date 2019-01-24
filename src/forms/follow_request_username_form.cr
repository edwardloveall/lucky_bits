class FollowRequestUsernameForm < Follow::BaseForm
  needs current_user : User
  virtual username : String

  def prepare
    validate_required username
    to = find_requested_user

    if to
      from_id.value = current_user.id
      to_id.value = to.id
    else
      username.add_error "is not associated with any user"
    end
  end

  private def find_requested_user : User?
    username.value.try do |value|
      UserQuery.new.username(value).first?
    end
  end
end
