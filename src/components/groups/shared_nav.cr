class Groups::SharedNav < BaseComponent
  needs group : Group

  def render
    nav class: "group" do
      ul do
        li { link "Info", to: Groups::Show.with(@group), flow_id: "group-nav-info" }
        li { link "Bits", to: Groups::Bits::Index.with(@group), flow_id: "group-nav-bits" }
      end
    end
  end
end
