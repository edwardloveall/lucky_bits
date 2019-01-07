class Bit < BaseModel
  table :bits do
    column title : String
    column url : String
    column description : String?
    belongs_to user : User
    has_many follows : Follow, through: :users
  end
end
