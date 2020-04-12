class Groups::ShowPage < MainLayout
  needs group : Group
  needs group_invite : GroupInvite

  def content
    h2 group.title
    mount Groups::SharedNav.new(group)

    section class: "group-members-section" do
      h2 "Members"
      ul do
        group.users.each do |user|
          li user.username, flow_id: "user-username"
        end
      end
    end

    section class: "group-invite-section" do
      h2 "Invite"
      render_group_invite_form(group_invite)
    end
  end

  private def render_group_invite_form(op : GroupInvite)
    form_for Memberships::Create.with(group_id: group.id) do
      field(op.username) { |field| text_input(field) }

      submit "Invite", flow_id: "create-membership"
    end
  end
end
