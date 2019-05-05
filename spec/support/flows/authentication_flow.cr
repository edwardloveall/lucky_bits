class AuthenticationFlow < BaseFlow
  private getter email
  private getter username

  def initialize(@email : String, @username : String)
  end

  def sign_up(password)
    visit SignUps::New
    fill_form SignUpForm,
      username: username,
      email: email,
      password: password,
      password_confirmation: password
    click "@sign-up-button"
  end

  def sign_in(password)
    visit SignIns::New
    fill_form SignInForm,
      email: email,
      password: password
    click "@sign-in-button"
  end

  def should_be_signed_in
    sign_out_button.should be_on_page
  end

  def sign_out
    visit Me::Show
    sign_out_button.click
  end
end
