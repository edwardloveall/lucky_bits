class Groups::New < BrowserAction
  get "/groups/new" do
    operation = SaveGroup.new
    html Groups::NewPage, save_group: operation
  end
end
