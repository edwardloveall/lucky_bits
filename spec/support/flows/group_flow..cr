class GroupFlow < AuthenticatedBaseFlow
  def visit_groups_page
    click "@main-group-nav"
  end

  def visit_group(title : String)
    click "@main-group-nav"
    el("@group-title", text: title).click
  end

  def create_new_group(title : String)
    click "@new-group"
    fill_form(GroupForm, title: title)
    click "@create-group"
  end

  def should_see_group(title : String)
    el("@group-title", text: title).should be_on_page
  end

  def should_see_username(username : String)
    el("@user-username", text: username).should be_on_page
  end
end
