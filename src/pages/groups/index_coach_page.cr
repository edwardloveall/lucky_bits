class Groups::IndexCoachPage < MainLayout
  private def page_title
    "My Groups"
  end

  def content
    h2 "Groups"
    para do
      text "You don't belong to any groups yet. Ask someone to invite you (your username is "
      strong @current_user.username
      text ") or create your own:"
    end

    link "New Group", to: Groups::New, flow_id: "new-group"
  end
end
