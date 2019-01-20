class UserFlow < BaseFlow
  def initialize(user : User)
    visit Me::Show, as: user
  end

  def visit_user_page(user : User)
    visit Users::Show.with(user.id)
  end

  def request_follow
    click "@request-user-follow"
  end

  def should_have_flash(text)
    el("@flash", text: text).should be_on_page
  end
end
