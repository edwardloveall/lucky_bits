# Add methods that all or most Flows need to share
class BaseFlow < LuckyFlow
  def sign_out_button
    el("@sign-out-button")
  end

  def should_have_password_error
    el("body", text: "Password is wrong").should be_on_page
  end

  def should_have_flash(text)
    el("@flash", text: text).should be_on_page
  end
end
