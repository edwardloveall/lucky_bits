class FollowAcceptForm < Follow::BaseForm
  def prepare
    accepted_at.value = Time.now
  end
end
