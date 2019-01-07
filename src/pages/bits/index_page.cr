class Bits::IndexPage < MainLayout
  include Shared::BitList

  needs bits : BitQuery

  def content
    bit_list(@bits)
  end
end
