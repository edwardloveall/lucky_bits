class Groups::Bits::FullFeed < FeedAction
  include AtomResponseHelper
  include BitFeed
  accepted_formats [:xml]

  get "/groups/:group_id/bits/feed/full" do
    group = GroupQuery.find(group_id)
    bits = BitQuery.new.from_group(group)
    latest_bit = BitQuery.new.from_group(group).first
    url = Groups::Bits::FullFeed.url(group)
    atom(bit_feed(bits, group, latest_bit.created_at, url))
  end
end
