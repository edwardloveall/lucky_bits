module Auth::RequireValidFeedToken
  macro included
    before require_valid_feed_token
  end

  private def require_valid_feed_token
    if current_user?
      continue
    else
      text(
        "This is not a valid feed token",
        status: HTTP::Status::UNAUTHORIZED
      )
    end
  end

  private def current_user? : User?
    UserQuery.new.feed_token(feed_token).first?
  end

  private def current_user : User
    current_user?.not_nil!
  end
end
