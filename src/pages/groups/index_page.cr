class Groups::IndexPage < MainLayout
  needs groups : GroupQuery

  def content
    link "New Group", to: Groups::New, flow_id: "new-group"
    h2 "Your Groups"
    ul do
      @groups.each do |group|
        li group.title, flow_id: "group-title"
      end
    end
  end
end
