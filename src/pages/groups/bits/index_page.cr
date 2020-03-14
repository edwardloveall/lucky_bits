class Groups::Bits::IndexPage < MainLayout
  include Shared::BitList

  needs group : Group
  needs bits : BitQuery

  def content
    h2 @group.title
    mount Groups::SharedNav.new(@group)

    section class: "new-bit-section" do
      link "New Bit", to: Groups::Bits::New.with(@group), flow_id: "new-group-bit-link"
    end

    section class: "group-bits-section" do
      h2 "Bits"
      bit_list(@bits)
    end
  end
end
