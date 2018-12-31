class FollowRequestForm < Follow::BaseForm
  needs current_user : User
  virtual email : String

  def prepare
    validate_required email
    to = find_requested_user

    if to
      from_id.value = current_user.id
      to_id.value = to.id
    else
      email.add_error "is not associated with any user"
    end
  end

  private def find_requested_user : User?
    email.value.try do |value|
      UserQuery.new.email(value).first?
    end
  end
end
