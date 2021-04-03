require "../spec_helper"

describe "GroupInvite" do
  describe "username" do
    it "is present" do
      GroupInvite.create(group_id: 1, username: "") do |op, _|
        op.username.errors.should(contain("is required"))
      end
    end

    it "matches an existing user" do
      GroupInvite.create(group_id: 1, username: "asdf") do |op, _|
        op.username.errors.should(contain("is not associated with any user"))
      end
    end

    it "won't allow an existing user to be added" do
      user = UserFactory.create(&.username("edward"))
      group = GroupFactory.create
      MembershipFactory.create(&.user_id(user.id).group_id(group.id))

      GroupInvite.create(group_id: group.id, username: "edward") do |op, _|
        op.username.errors.should(contain("is already in the group"))
      end
    end
  end
end
