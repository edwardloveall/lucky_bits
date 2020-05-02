class Groups::ShowPage < MainLayout
  needs group : Group
  needs group_invite : GroupInvite

  private def page_title
    group.title
  end

  def content
    h2 group.title
    mount Groups::SharedNav.new(group)

    section class: "group-members-section section" do
      h2 "Members"
      ul do
        group.users.each do |user|
          li user.username, flow_id: "user-username"
        end
      end
    end

    section class: "group-invite-section section" do
      h2 "Invite"
      render_group_invite_form(group_invite)
    end

    section class: "group-bookmarklet section" do
      h2 "Bookmarklet"
      mount Groups::BookmarkletDescription.new
      mount Groups::Bookmarklet.new(group)
    end

    section class: "section" do
      full = Groups::Bits::FullFeed.with(group, feed_token: feed_token)
      personal = Groups::Bits::PersonalFeed.with(group, feed_token: feed_token)

      h2 "Feeds"
      ul do
        li { link "All Bits", to: full }
        li { link "All Bits (except yours)", to: personal }
      end
    end
  end

  private def render_group_invite_form(op : GroupInvite)
    form_for Memberships::Create.with(group_id: group.id) do
      field(op.username) { |field| text_input(field) }

      submit "Invite", flow_id: "create-membership"
    end
  end

  private def feed_token
    current_user.feed_token
  end
end
