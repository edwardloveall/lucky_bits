class Membership < BaseModel
  table :memberships do
    belongs_to group : Group
    belongs_to user : User
  end
end
