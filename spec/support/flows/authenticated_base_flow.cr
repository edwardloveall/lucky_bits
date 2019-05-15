abstract class AuthenticatedBaseFlow < BaseFlow
  private getter user
  delegate email, to: user

  def initialize(@user : User)
  end

  def sign_in(email : String, password : String)
    visit SignIns::New
    fill_form SignInForm,
      email: email,
      password: password
    click "@sign-in-button"
  end

  def sign_in(as this_user : User = @user)
    visit Me::Show, as: this_user
  end

  def sign_out
    visit_my_page
    sign_out_button.click
  end

  def visit_my_page
    visit Me::Show
  end

  def visit_bit_index_page
    click "@main-follow-nav"
  end

  def visit_follows_page
    click "@main-follow-nav"
  end

  def should_be_signed_in
    sign_out_button.should be_on_page
  end
end
