class FollowFlow < BaseFlow
  private getter user : User

  def initialize(@user : User)
  end

  def visit_new_follows_page
    visit Follows::New, as: user
  end

  def visit_follows_page
    visit Follows::Index, as: user
  end

  def follow(user to_follow : User)
    fill_form(
      FollowRequestUsernameForm,
      username: to_follow.username,
    )
    click "@create-follow-request-form-submit"
  end

  def allow_user_to_follow(user to_follow : User)
    allow_link = el("@allow-follow-#{to_follow.username}")
    allow_link.click
  end

  def follow_back(user follower : User)
    click("@follow-back-#{follower.username}")
  end

  def should_see_user_in_followers_list(user following : User)
    el(".followers li", text: following.username)
  end

  def should_show_follow_request_to(user following : User)
    el("@flash", text: "Your follow request has been sent to #{following.username} for approval!")
  end
end
