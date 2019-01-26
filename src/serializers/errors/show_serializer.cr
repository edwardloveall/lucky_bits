class Errors::ShowSerializer < Lucky::Serializer
  def initialize(@message : String, @details : String? = nil)
  end

  def render
    {message: @message, details: @details}
  end
end
