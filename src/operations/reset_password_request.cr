class ResetPasswordRequest < Avram::Operation
  include UserFromEmail

  attribute email : String

  def run
    user = user_from_email
    validate(user)

    if valid?
      user
    else
      nil
    end
  end

  def validate(user : User?)
    validate_required email
    if user.nil?
      email.add_error "is not in our system"
    end
  end
end
