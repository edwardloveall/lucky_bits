class Bit < BaseModel
  table :bits do
    column title : String
    column url : String
    column description : String?
    belongs_to user : User
    belongs_to group : Group
  end
end
