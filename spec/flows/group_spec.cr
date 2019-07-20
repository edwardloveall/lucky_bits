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
