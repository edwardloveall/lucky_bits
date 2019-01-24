# Add methods that all or most Flows need to share
class BaseFlow < LuckyFlow
  def sign_out
    visit Me::Show
    sign_out_button.click
  end

  private def sign_out_button
    el("@sign-out-button")
  end
end
