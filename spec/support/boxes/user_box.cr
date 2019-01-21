class UserBox < LuckyRecord::Box
  def initialize
    email "test@example.com"
    encrypted_password Authentic.generate_encrypted_password("password")
    feed_token Random::Secure.hex(16)
    username "test"
  end
end
