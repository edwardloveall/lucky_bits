class ResetPasswordRequest < Avram::Operation
  include UserFromEmail

  attribute email : String

  def submit
    user = user_from_email
    validate(user)

    if valid?
      yield self, user
    else
      yield self, nil
    end
  end

  def validate(user : User?)
    validate_required email
    if user.nil?
      email.add_error "is not in our system"
    end
  end
end
