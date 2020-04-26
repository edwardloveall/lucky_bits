class Groups::Bits::IndexCoachPage < MainLayout
  needs group : Group

  private def page_title
    group.title
  end

  def content
    h2 group.title
    mount Groups::SharedNav.new(group)

    section class: "group-bits-section section" do
      h2 "Bits"
      para do
        text "There are no bits here yet, but you can create one "
        link "here", to: Groups::Bits::New.with(group), flow_id: "new-group-bit-link"
        text "."
      end
    end
  end
end
