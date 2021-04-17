require "../spec_helper"

describe "A user" do
  it "can update password on account page" do
    old_pass = Authentic.generate_encrypted_password("password")
    user = UserFactory.create(&.encrypted_password(old_pass))
    flow = UserFlow.new(user)

    flow.sign_in
    flow.visit_my_account
    flow.update_password("my great password")
    flow.sign_out
    flow.sign_in(email: user.email, password: "my great password")

    flow.should_be_signed_in
  end
end
