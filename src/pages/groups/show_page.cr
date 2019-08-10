class Groups::ShowPage < MainLayout
  needs group : Group

  def content
    h2 "Members of #{@group.title}"
    ul do
      @group.users.each do |user|
        li user.username, flow_id: "user-username"
      end
    end
  end
end
