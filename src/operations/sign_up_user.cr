class SignUpUser < User::SaveOperation
  # Change password validations in src/forms/mixins/password_validations.cr
  include PasswordValidations

  permit_columns username
  permit_columns email
  permit_columns feed_token
  attribute password : String
  attribute password_confirmation : String

  before_save prepare

  def prepare
    validate_uniqueness_of email
    validate_uniqueness_of(
      downcased(username),
      query: UserQuery.new.username.lower
    )
    run_password_validations
    Authentic.copy_and_encrypt password, to: encrypted_password
    feed_token.value = generate_feed_token
  end

  private def generate_feed_token
    Random::Secure.hex(16)
  end

  private def downcased(field : Avram::Attribute)
    field.dup.tap do |downcased_field|
      downcased_field.value = field.value.try(&.downcase)
    end
  end
end
