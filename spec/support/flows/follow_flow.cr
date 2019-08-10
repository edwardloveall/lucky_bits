class FollowFlow < AuthenticatedBaseFlow
  def follow(user to_follow : User)
    fill_form(
      FollowRequestUsername,
      username: to_follow.username,
    )
    click "@create-follow-request-form-submit"
  end

  def follow_back(user follower : User)
    click("@follow-back-#{follower.username}")
  end

  def deny_follow(user follower : User)
    click("@deny-follow-#{follower.username}")
  end

  def allow_user_to_follow(user to_follow : User)
    allow_link = el("@allow-follow-#{to_follow.username}")
    allow_link.click
  end

  def should_have_requested_to_follow
    el(".flash-success", text: "Your invite has been sent for approval!").should be_on_page
  end

  def should_see_follower(user following : User)
    el(".followers li", text: following.username).should be_on_page
  end

  def should_not_see_follower(user following : User)
    el(".followers li", text: following.username).should_not be_on_page
  end

  def should_not_see_follow_request_from(user : User)
    el(".follow-requests li", text: user.username).should_not be_on_page
  end
end
