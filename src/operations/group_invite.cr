class GroupInvite < Membership::SaveOperation
  attribute username : String

  before_save prepare

  def prepare
    validate_required username
    return if username.errors.any?

    user_from_username = find_requested_user
    validate_user_exists user_from_username

    if username && user_from_username
      user_id.value = user_from_username.id
      validate_user_not_already_in_group group_id.value, user_from_username
    end
  end

  private def validate_user_exists(user : User?)
    if !user
      username.add_error "is not associated with any user"
    end
  end

  private def find_requested_user : User?
    username.value.try do |value|
      UserQuery.new.username(value).first?
    end
  end

  private def validate_user_not_already_in_group(
    group_id : Int64?,
    user : User
  )
    if group_id
      if GroupQuery.new.contains_user?(group_id, user)
        username.add_error "is already in the group"
      end
    else
      raise "Group id does not exist: #{group_id}"
    end
  end
end
