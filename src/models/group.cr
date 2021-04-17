class Group < BaseModel
  table :groups do
    column title : String
    has_many memberships : Membership
    has_many users : User, through: [:memberships, :user]
  end
end
