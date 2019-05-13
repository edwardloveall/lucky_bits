require "../spec_helper"

describe "User visits bit homepage" do
  it "creates a bit" do
    user = UserBox.create
    flow = BitFlow.new(user: user)

    flow.sign_in
    flow.visit_bit_index
    flow.goto_new_bit_form
    flow.submit_new_bit

    flow.should_see_bit_on_page
  end

  it "edits one of their bits" do
    user = UserBox.create
    flow = BitFlow.new(user: user)
    bit = BitBox.create(&.user_id(user.id))

    flow.sign_in
    flow.visit_my_page
    flow.click_on_edit_bit(bit)
    flow.el("[name='bit:title']").clear
    flow.fill_form(BitForm, title: "Edited Bit")
    flow.submit_bit_form

    flow.el("@bit-title", text: "Edited Bit").should be_on_page
  end

  it "can not edit a different bit" do
    user = UserBox.create
    flow = BitFlow.new(user: user)
    bit = BitBox.create(&.user_id(user.id))

    flow.sign_in
    flow.visit_my_page
    flow.click_on_delete_bit(bit)
    flow.visit_my_page

    flow.el("@bit-title", text: "Edited Bit").should_not be_on_page
  end
end
