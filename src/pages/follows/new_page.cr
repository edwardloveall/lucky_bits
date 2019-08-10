class Follows::NewPage < MainLayout
  needs follow_request : FollowRequestUsername

  def content
    render_follow_request_form(@follow_request)
  end

  private def render_follow_request_form(op)
    form_for Follows::Create do
      field(op.username) { |field| text_input(field, autofocus: true) }

      submit "Request to follow", flow_id: "create-follow-request-form-submit"
    end
  end
end
