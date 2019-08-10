class Groups::New < BrowserAction
  route do
    operation = SaveGroup.new
    render Groups::NewPage, save_group: operation
  end
end
