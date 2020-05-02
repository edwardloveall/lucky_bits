class NullUser
  def id
    -1
  end
end

alias UserLike = User | NullUser
