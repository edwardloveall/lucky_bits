class Groups::Bits::PersonalFeed < FeedAction
  include AtomResponseHelper
  include BitFeed
  accepted_formats [:xml]

  get "/groups/:group_id/bits/feed/personal" do
    group = GroupQuery.find(group_id)
    bits = BitQuery.new.from_group(group, without_bits_from: current_user)
    latest_bit = BitQuery.new.from_group(group).first?
    last_updated = latest_bit && latest_bit.created_at || Time.unix_ms(0)
    url = Groups::Bits::PersonalFeed.url(group)
    atom(bit_feed(bits, group, last_updated, url))
  end
end
