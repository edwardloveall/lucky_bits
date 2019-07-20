class Groups::NewPage < MainLayout
  needs group_form : GroupForm

  def content
    render_group_form(@group_form)
  end

  private def render_group_form(form : GroupForm)
    form_for(Groups::Create) do
      field(form.title) { |field| text_input(field, autofocus: true) }

      submit "Create Group", flow_id: "create-group"
    end
  end
end
