class Bits::IndexPage < MainLayout
  include Shared::BitList

  needs bits : BitQuery

  private def page_title
    "My Bits"
  end

  def content
    para do
      text "These bits come from the ones you posted to your "
      link "groups", to: Groups::Index
    end
    bit_list(bits)
  end
end
