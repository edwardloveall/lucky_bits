module Shared::BitList
  def bit_list(bits : BitQuery)
    ul class: "bits" do
      bits.each do |bit|
        li class: "bit" do
          link bit.title, to: bit.url, flow_id: "bit-title"
          if description = bit.description
            para description
          end
          if @current_user == bit.user
            link "Edit", to: Bits::Edit.with(bit), flow_id: "edit-bit-#{bit.id}"
            link "Delete", to: Bits::Delete.with(bit), flow_id: "delete-bit-#{bit.id}"
          end
          aside class: "meta" do
            link bit.user.username, to: Users::Show.with(bit.user), class: "author"
            span class: "timestamp" do
              text time_ago_in_words(bit.created_at)
              text " ago"
            end
          end
        end
      end
    end
  end
end
