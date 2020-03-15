require "../spec_helper"

describe "User invites someone to a group" do
  it "shows them in the group list" do
    user1 = UserBox.create(&.username("edward"))
    group = GroupBox.create
    MembershipBox.create(&.user_id(user1.id).group_id(group.id))
    user2 = UserBox.create(&.username("elizabeth"))
    flow = GroupFlow.new(user1)

    flow.sign_in
    flow.visit_group(group.title)
    flow.visit_group_info(group)
    flow.add_user_to_group(username: user2.username, group: group)

    flow.should_see_username(user2.username)
  end
end
