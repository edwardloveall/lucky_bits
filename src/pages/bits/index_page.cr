class Bits::IndexPage < MainLayout
  needs bits : BitQuery

  def content
    ul class: "bits" do
      @bits.each do |bit|
        li class: "bit" do
          link bit.title, to: bit.url
        end
      end
    end
  end
end
