require "../spec_helper"

describe "Visit a user to follow them" do
  it "has a follow button on the user page" do
    user1 = UserBox.create(&.email("user1@example.com").username("user1"))
    flow = UserFlow.new(user1)
    user2 = UserBox.create(&.email("user2@example.com").username("user2"))

    flow.sign_in
    flow.visit_user_page(user2)
    flow.request_follow

    flow.should_have_flash("Your invite has been sent for approval!")
  end

  it "can update password on account page" do
    old_pass = Authentic.generate_encrypted_password("password")
    user = UserBox.create(&.encrypted_password(old_pass))
    flow = UserFlow.new(user)

    flow.sign_in
    flow.visit_my_account
    flow.update_password("my great password")
    flow.sign_out
    flow.sign_in(email: user.email, password: "my great password")

    flow.should_be_signed_in
  end
end
