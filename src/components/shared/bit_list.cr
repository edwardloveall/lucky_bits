module Shared::BitList
  def bit_list(bits : BitQuery)
    ul class: "bits" do
      bits.each do |bit|
        li class: "bit" do
          link bit.title, to: bit.url, flow_id: "bit-title"
          if @current_user == bit.user
            link "Edit", to: Bits::Edit.with(bit), flow_id: "edit-bit-#{bit.id}"
            link "Delete", to: Bits::Delete.with(bit), flow_id: "delete-bit-#{bit.id}"
          end
          para "from: #{bit.user.username}"
        end
      end
    end
  end
end
