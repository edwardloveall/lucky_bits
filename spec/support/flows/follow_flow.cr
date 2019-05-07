class FollowFlow < AuthenticatedBaseFlow
  def follow(user to_follow : User)
    fill_form(
      FollowRequestUsernameForm,
      username: to_follow.username,
    )
    click "@create-follow-request-form-submit"
  end

  def follow_back(user follower : User)
    click("@follow-back-#{follower.username}")
  end

  def allow_user_to_follow(user to_follow : User)
    allow_link = el("@allow-follow-#{to_follow.username}")
    allow_link.click
  end

  def should_see_user_in_followers_list(user following : User)
    el(".followers li", text: following.username)
  end
end
