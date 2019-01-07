class User < BaseModel
  include Carbon::Emailable
  include Authentic::PasswordAuthenticatable

  table :users do
    column email : String
    column encrypted_password : String
    has_many bits : Bit
    has_many follows : Follow, foreign_key: :to_id
  end

  def emailable
    Carbon::Address.new(email)
  end
end
