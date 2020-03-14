class Groups::IndexPage < MainLayout
  needs groups : GroupQuery

  def content
    link "New Group", to: Groups::New, flow_id: "new-group"
    h2 "Your Groups"
    ul do
      @groups.each do |group|
        li class: "group" do
          link group.title, to: Groups::Bits::Index.with(group), flow_id: "group-title"
        end
      end
    end
  end
end
