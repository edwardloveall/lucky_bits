require "../spec_helper"

describe "User visits new follow page" do
  it "can follow a user by their username" do
    user1 = UserBox.create(&.email("user1@example.com").username("user1"))
    user2 = UserBox.create(&.email("user2@example.com").username("user2"))
    flow1 = FollowFlow.new(user: user1)
    flow2 = FollowFlow.new(user: user2)

    flow1.visit_new_follows_page
    flow1.follow(user: user2)
    flow1.sign_out

    flow2.visit_follows_page
    flow2.allow_user_to_follow(user: user1)

    flow2.should_see_user_in_followers_list(user1)
  end
end
