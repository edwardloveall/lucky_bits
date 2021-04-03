class BitFactory < Avram::Factory
  def initialize
    title "LinkyBits"
    url "https://linkybits.net"
    description "Maybe we could use this to share links?"
    user_id UserFactory.create.id
  end
end
