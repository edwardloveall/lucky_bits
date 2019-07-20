class User < BaseModel
  include Carbon::Emailable
  include Authentic::PasswordAuthenticatable

  table :users do
    column email : String
    column encrypted_password : String
    column feed_token : String
    column username : String
    has_many bits : Bit
    has_many follows : Follow, foreign_key: :to_id
    has_many memberships : Membership
    has_many groups : Group, through: :memberships
  end

  def emailable
    Carbon::Address.new(email)
  end
end
