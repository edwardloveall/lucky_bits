module Shared::BitList
  def bit_list(bits : BitQuery)
    ul class: "bits" do
      bits.each do |bit|
        li class: "bit" do
          link bit.title, to: bit.url
          para "from: #{bit.user.email}"
        end
      end
    end
  end
end
