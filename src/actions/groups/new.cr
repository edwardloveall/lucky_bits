class Groups::New < BrowserAction
  route do
    form = GroupForm.new
    render Groups::NewPage, group_form: form
  end
end
