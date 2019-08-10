class SignInUser < Avram::Operation
  include UserFromEmail

  attribute email : String
  attribute password : String

  def submit
    user = user_from_email
    validate_credentials(user)

    if valid?
      yield self, user
    else
      yield self, nil
    end
  end

  private def validate_credentials(user : User?)
    if user
      unless Authentic.correct_password?(user, password.value.to_s)
        password.add_error "is wrong"
      end
    else
      email.add_error "is not in our system"
    end
  end
end
