class Groups::NewPage < MainLayout
  needs save_group : SaveGroup

  private def page_title
    "New Group"
  end

  def content
    h2 "Create Group"
    render_group_form(save_group)
  end

  private def render_group_form(op : SaveGroup)
    form_for(Groups::Create) do
      field(op.title) { |field| text_input(field, autofocus: true) }

      submit "Create Group", flow_id: "create-group"
    end
  end
end
