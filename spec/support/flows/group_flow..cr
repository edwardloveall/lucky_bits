class GroupFlow < AuthenticatedBaseFlow
  def visit_groups_page
    click "@main-group-nav"
  end

  def create_new_group(title : String)
    click "@new-group"
    fill_form(GroupForm, title: title)
    click "@create-group"
  end

  def should_see_group(title : String)
    el("@group-title", text: title).should be_on_page
  end
end
