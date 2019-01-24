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
      FollowRequestEmailForm,
      email: to_follow.email,
    )
    click "@create-follow-request-form-submit"
  end

  def allow_user_to_follow(user to_follow : User)
    allow_link = el("@allow-follow-#{to_follow.id}")
    allow_link.click
  end

  def should_see_user_in_followers_list(user following : User)
    el(".followers li", text: following.email)
  end
end
