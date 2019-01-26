module Shared::BitList
  def bit_list(bits : BitQuery)
    ul class: "bits" do
      bits.each do |bit|
        li class: "bit" do
          link bit.title, to: bit.url, flow_id: "bit-title"
          para "from: #{bit.user.username}"
        end
      end
    end
  end
end
