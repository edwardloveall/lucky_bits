class Follows::NewPage < MainLayout
  needs follow_request_form : FollowRequestForm

  def content
    render_follow_request_form(@follow_request_form)
  end

  private def render_follow_request_form(form)
    form_for Follows::Create do
      field(form.email) { |field| text_input field }

      submit "Request to follow"
    end
  end
end
