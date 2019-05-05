abstract class AuthenticatedBaseFlow < BaseFlow
  def initialize(@user : User)
  end

  def user
    @user
  end

  def sign_in(password : String)
    visit SignIns::New
    fill_form SignInForm,
      email: email,
      password: password
    click "@sign-in-button"
  end

  def sign_in_user
    visit Me::Show, as: user
  end

  def sign_out
    visit Me::Show
    sign_out_button.click
  end

  def visit_follows_page
    click "@main-follow-nav"
  end

  def should_be_signed_in
    sign_out_button.should be_on_page
  end
end
