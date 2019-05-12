class UserBox < BaseBox
  def initialize
    email "#{sequence("email")}@example.com"
    encrypted_password Authentic.generate_encrypted_password("password")
    feed_token Random::Secure.hex(16)
    username sequence("username")
  end
end
