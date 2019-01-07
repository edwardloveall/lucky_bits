class Follows::IndexPage < MainLayout
  needs follow_requests : FollowQuery
  needs followers : FollowQuery
  needs following : FollowQuery

  def content
    link "Follow someone", to: Follows::New
    h3 "Email:  #{@current_user.email}"
    list_follow_requests(@follow_requests)
    list_followers(@followers)
    list_following(@following)
  end

  private def list_follow_requests(follow_requests : FollowQuery)
    h3 "Follow Requests"
    ul do
      follow_requests.each do |follow|
        li "#{follow.from.email}"
        link "Allow", to: Follows::Update.with(follow.id)
      end
    end
  end

  private def list_followers(followers : FollowQuery)
    h3 "Followers"
    ul do
      followers.each do |follow|
        li "#{follow.from.email}"
      end
    end
  end

  private def list_following(following : FollowQuery)
    h3 "Following"
    ul do
      following.each do |follow|
        li "#{follow.to.email}"
      end
    end
  end
end
