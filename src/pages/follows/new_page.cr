class Follows::NewPage < MainLayout
  needs follow_request_form : FollowRequestUsernameForm

  def content
    render_follow_request_form(@follow_request_form)
  end

  private def render_follow_request_form(form)
    form_for Follows::Create do
      field(form.username) { |field| text_input(field, autofocus: true) }

      submit "Request to follow", flow_id: "create-follow-request-form-submit"
    end
  end
end
