class ResetPassword < User::SaveOperation
  # Change password validations in src/forms/mixins/password_validations.cr
  include PasswordValidations

  attribute password : String
  attribute password_confirmation : String

  before_save prepare

  def prepare
    run_password_validations
    Authentic.copy_and_encrypt password, to: encrypted_password
  end
end
