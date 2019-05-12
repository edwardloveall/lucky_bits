class Follows::IndexPage < MainLayout
  needs follow_requests : FollowQuery
  needs followers : FollowQuery
  needs following : FollowQuery

  def content
    link "Follow someone", to: Follows::New, flow_id: "new-follow"
    list_follow_requests(@follow_requests)
    list_followers(@followers, @following)
    list_following(@following)
  end

  private def list_follow_requests(follow_requests : FollowQuery)
    section class: "follow-requests" do
      h3 "Follow Requests"
      ul do
        follow_requests.each do |follow|
          li "#{follow.from.username}"
          allow_follow_link(follow)
          deny_follow_link(follow)
        end
      end
    end
  end

  def allow_follow_link(follow : Follow)
    link(
      "Allow",
      to: Follows::Update.with(follow.id),
      flow_id: "allow-follow-#{follow.from.username}"
    )
  end

  def deny_follow_link(follow)
    link(
      "Deny",
      to: Follows::Delete.with(follow.id),
      flow_id: "deny-follow-#{follow.from.username}"
    )
  end

  private def list_followers(followers : FollowQuery, following : FollowQuery)
    section class: "followers" do
      h3 "Followers"
      ul do
        followers.each do |follow|
          li "#{follow.from.username}"
          if !following.includes?(follow)
            follow_back_link(follow)
          end
        end
      end
    end
  end

  def follow_back_link(follow : Follow)
    link(
      "Follow back",
      to: Users::Follows::Create.with(user_id: follow.from.id),
      flow_id: "follow-back-#{follow.from.username}"
    )
  end

  private def list_following(following : FollowQuery)
    section class: "following" do
      h3 "Following"
      ul do
        following.each do |follow|
          li "#{follow.to.username}"
        end
      end
    end
  end
end
