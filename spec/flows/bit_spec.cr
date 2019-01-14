require "../spec_helper"

describe "User visits bit homepage" do
  it "creates a bit" do
    user = UserBox.create
    flow = BitFlow.new(user: user)

    flow.visit_bit_index
    flow.goto_new_bit_form
    flow.submit_new_bit

    flow.should_see_bit_on_page
  end
end
