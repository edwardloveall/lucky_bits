abstract class FeedAction < Lucky::Action
  include Auth::RequireValidFeedToken
  expose current_user

  param feed_token : String = ""
end
