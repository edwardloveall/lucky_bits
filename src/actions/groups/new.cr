class Groups::New < BrowserAction
  route do
    operation = SaveGroup.new
    html Groups::NewPage, save_group: operation
  end
end
