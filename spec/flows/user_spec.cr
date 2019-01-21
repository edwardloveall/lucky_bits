require "../spec_helper"

describe "Visit a user to follow them" do
  it "has a follow button on the user page" do
    user1 = UserBox.create(&.email("user1@example.com").username("user1"))
    flow = UserFlow.new(user1)
    user2 = UserBox.create(&.email("user2@example.com").username("user2"))

    flow.visit_user_page(user2)
    flow.request_follow

    flow.should_have_flash("Your invite has been sent for approval!")
  end
end
