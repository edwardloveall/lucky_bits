require "../spec_helper"

describe "Authentication flow" do
  it "works" do
    flow = AuthenticationFlow.new(email: "test@example.com", username: "test")

    flow.sign_up "password"
    flow.should_be_signed_in
    flow.sign_out
    flow.sign_in "wrong-password"
    flow.should_have_password_error
    flow.sign_in "password"
    flow.should_be_signed_in
  end

  it "maintains the username's case" do
    flow = AuthenticationFlow.new(email: "test@example.com", username: "edWARD")

    flow.sign_up "password"
    flow.visit Me::Show

    flow.el("h3", text: "edWARD").should be_on_page
  end
end

private def should_be_signed_in(flow)
  flow.el("@sign-out-button").should be_on_page
end
