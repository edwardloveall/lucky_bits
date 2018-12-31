class Follow < BaseModel
  table :follows do
    belongs_to from : User
    belongs_to to : User
    column accepted_at : Time?
  end
end
