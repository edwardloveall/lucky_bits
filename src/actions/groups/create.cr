class Groups::Create < BrowserAction
  post "/groups" do
    SaveGroup.create(params: params) do |operation, group|
      if group
        flash.success = "Group created!"
        SaveMembership.create!(group_id: group.id, user_id: current_user.id)
        redirect Groups::Index
      else
        html Groups::NewPage, save_group: operation
      end
    end
  end
end
