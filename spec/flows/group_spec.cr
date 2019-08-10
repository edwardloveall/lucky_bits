require "../spec_helper"

describe "User creates a new group" do
  it "is automatically added to it" do
    user = UserBox.create
    flow = GroupFlow.new(user)

    flow.sign_in
    flow.visit_groups_page
    flow.create_new_group(title: "Work Friends")

    flow.should_see_group(title: "Work Friends")
  end
end

describe "User visits a group they are a part of" do
  it "see users part of the group" do
    user1 = UserBox.create(&.username("edward"))
    user2 = UserBox.create(&.username("elizabeth"))
    group = GroupBox.create
    MembershipBox.create(&.user_id(user1.id).group_id(group.id))
    MembershipBox.create(&.user_id(user2.id).group_id(group.id))
    flow = GroupFlow.new(user1)

    flow.sign_in
    flow.visit_group(group.title)

    flow.should_see_username(user1.username)
    flow.should_see_username(user2.username)
  end
end

describe "User invites someone to a group" do
  it "shows them in the group list" do
    user1 = UserBox.create(&.username("edward"))
    user2 = UserBox.create(&.username("elizabeth"))
    group = GroupBox.create
    MembershipBox.create(&.user_id(user1.id).group_id(group.id))
    flow = GroupFlow.new(user1)

    flow.sign_in
    flow.visit_group(group.title)
    flow.add_user_to_group(user: user2, group: group)
    flow.visit_group(group.title)

    flow.should_see_username(user2.username)
  end
end