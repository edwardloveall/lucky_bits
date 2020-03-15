class GroupFlow < AuthenticatedBaseFlow
  def visit_groups_page
    click "@main-group-nav"
  end

  def visit_group(title : String)
    click "@main-group-nav"
    el("@group-title", text: title).click
  end

  def visit_group_info(group : Group)
    click "@group-nav-info"
  end

  def visit_group_bits(group : Group)
    click "@group-nav-bits"
  end

  def create_new_group(title : String)
    click "@new-group"
    fill_form(SaveGroup, title: title)
    click "@create-group"
  end

  def add_user_to_group(username : String, group : Group)
    fill_form(GroupInvite, username: username)
    click "@create-membership"
  end

  def should_see_group(title : String)
    el("@group-title", text: title).should be_on_page
  end

  def should_see_username(username : String)
    el("@user-username", text: username).should be_on_page
  end

  def should_see_username_error(message : String)
    el("@username-error", text: message).should be_on_page
  end
end
