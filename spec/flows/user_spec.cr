require "../spec_helper"

describe "Visit a user to follow them" do
  it "has a follow button on the user page" do
    current_user = UserBox.create(&.email("user@example.com"))
    flow = UserFlow.new(current_user)
    existing_user = UserBox.create(&.email("existing@example.com"))

    flow.visit_user_page(existing_user)
    flow.request_follow

    flow.should_have_flash("Your invite has been sent for approval!")
  end
end
