class Bits::IndexPage < MainLayout
  include Shared::BitList

  needs bits : BitQuery

  private def page_title
    "My Bits"
  end

  def content
    bit_list(bits)
  end
end
