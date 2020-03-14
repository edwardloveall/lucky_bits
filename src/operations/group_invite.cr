class GroupInvite < Membership::SaveOperation
  attribute username : String

  before_save prepare

  def prepare
    validate_required username
    user_from_username = find_requested_user

    if user_from_username
      user_id.value = user_from_username.id
    elsif username_present?
      username.add_error "is not associated with any user"
    end
  end

  private def find_requested_user : User?
    username.value.try do |value|
      UserQuery.new.username(value).first?
    end
  end

  private def username_present?
    !username.value.blank?
  end
end
