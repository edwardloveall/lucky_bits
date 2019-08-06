class GroupInviteForm < Membership::BaseForm
  virtual username : String

  def prepare
    validate_required username
    user = find_requested_user

    if user
      user_id.value = user.id
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
