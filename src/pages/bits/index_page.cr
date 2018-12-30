class Bits::IndexPage < MainLayout
  needs bits : BitQuery

  def content
    ul class: "bits" do
      @bits.each do |bit|
        link bit.title, to: bit.url
      end
    end
  end
end
