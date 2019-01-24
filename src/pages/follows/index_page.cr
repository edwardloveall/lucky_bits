class Follows::IndexPage < MainLayout
  needs follow_requests : FollowQuery
  needs followers : FollowQuery
  needs following : FollowQuery

  def content
    link "Follow someone", to: Follows::New
    list_follow_requests(@follow_requests)
    list_followers(@followers)
    list_following(@following)
  end

  private def list_follow_requests(follow_requests : FollowQuery)
    section class: "follow-requests" do
      h3 "Follow Requests"
      ul do
        follow_requests.each do |follow|
          li "#{follow.from.email}"
          link(
            "Allow",
            to: Follows::Update.with(follow.id),
            flow_id: "allow-follow-#{follow.from.id}"
          )
        end
      end
    end
  end

  private def list_followers(followers : FollowQuery)
    section class: "followers" do
      h3 "Followers"
      ul do
        followers.each do |follow|
          li "#{follow.from.email}"
        end
      end
    end
  end

  private def list_following(following : FollowQuery)
    section class: "following" do
      h3 "Following"
      ul do
        following.each do |follow|
          li "#{follow.to.email}"
        end
      end
    end
  end
end
