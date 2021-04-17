require "../spec_helper"

describe "User visits bit homepage" do
  it "creates a bit" do
    user = UserFactory.create
    group = GroupFactory.create(&.title("Fun Pod"))
    MembershipFactory.create(&.user_id(user.id).group_id(group.id))
    flow = BitFlow.new(user: user)

    flow.sign_in
    flow.visit_group_index
    flow.visit_group("Fun Pod")
    flow.goto_group_new_bit_form
    flow.submit_new_bit

    flow.should_see_bit_on_page
  end

  it "fills in bit details from a bookmarklet URL params" do
    user = UserFactory.create
    group = GroupFactory.create(&.title("Fun Pod"))
    MembershipFactory.create(&.user_id(user.id).group_id(group.id))
    flow = BitFlow.new(user: user)

    flow.sign_in
    flow.visit Groups::Bits::New.path(group, title: "LinkyBits", url: "https://linkybits.net")

    flow.el("#bit_title").value.should eq("LinkyBits")
    flow.el("#bit_url").value.should eq("https://linkybits.net")
  end

  it "edits one of their bits" do
    user = UserFactory.create
    group = GroupFactory.create(&.title("Fun Pod"))
    MembershipFactory.create(&.user_id(user.id).group_id(group.id))
    flow = BitFlow.new(user: user)
    bit = BitFactory.create(&.user_id(user.id).group_id(group.id))

    flow.sign_in
    flow.visit_group_index
    flow.visit_group("Fun Pod")
    flow.click_on_edit_bit(bit)
    flow.fill_form(SaveBit, title: "Edited Bit")
    flow.submit_bit_form

    flow.el("@bit-title", text: "Edited Bit").should be_on_page
  end

  it "can't edit a different bit" do
    user1 = UserFactory.create
    user2 = UserFactory.create
    group = GroupFactory.create(&.title("Fun Pod"))
    MembershipFactory.create(&.user_id(user1.id).group_id(group.id))
    MembershipFactory.create(&.user_id(user2.id).group_id(group.id))
    flow = BitFlow.new(user: user1)
    bit = BitFactory.create(&.user_id(user2.id)
      .title("Cool website!")
      .group_id(group.id))

    flow.sign_in
    flow.visit_group_index
    flow.visit_group("Fun Pod")

    flow.el("@bit-title", text: "Cool website!").should be_on_page
    flow.el("@edit-bit-#{bit.id}").should_not be_on_page
    flow.el("@delete-bit-#{bit.id}").should_not be_on_page
  end

  it "can delete a bit" do
    user = UserFactory.create
    group = GroupFactory.create(&.title("Fun Pod"))
    MembershipFactory.create(&.user_id(user.id).group_id(group.id))
    flow = BitFlow.new(user: user)
    bit = BitFactory.create(&.user_id(user.id).group_id(group.id))

    flow.sign_in
    flow.visit_group_index
    flow.visit_group("Fun Pod")
    flow.click_on_delete_bit(bit)
    flow.visit_my_page

    flow.el("@bit-title", text: "Edited Bit").should_not be_on_page
  end

  it "shows only my bits" do
    user = UserFactory.create
    other = UserFactory.create
    group = GroupFactory.create
    MembershipFactory.create(&.user_id(user.id).group_id(group.id))
    MembershipFactory.create(&.user_id(other.id).group_id(group.id))
    flow = BitFlow.new(user: user)
    bit = BitFactory.create(&.user_id(user.id).group_id(group.id).title("Meee"))
    other_bit = BitFactory.create(&.user_id(other.id).group_id(group.id).title("Someone else"))

    flow.sign_in
    flow.visit_bit_index

    flow.el("@bit-title", text: "Meee").should be_on_page
    flow.el("@bit-title", text: "Someone else").should_not be_on_page
  end
end
