class BitBox < Avram::Box
  def initialize
    title "LinkyBits"
    url "https://linkybits.net"
    description "Maybe we could use this to share links?"
    user_id UserBox.create().id
  end
end
