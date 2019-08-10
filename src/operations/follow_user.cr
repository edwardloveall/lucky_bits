class FollowUser < Follow::SaveOperation
  before_save prepare

  def prepare
    accepted_at.value = Time.now
  end
end
