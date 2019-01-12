module AtomResponseHelper
  private def atom(body, status : Int32? = nil)
    Lucky::TextResponse.new(
      context: context,
      content_type: "application/atom+xml",
      body: body,
      status: status
    )
  end

  private def atom(body, status : Lucky::Action::Status)
    atom(body, status: status.value)
  end
end
