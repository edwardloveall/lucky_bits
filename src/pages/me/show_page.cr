class Me::ShowPage < MainLayout
  include Shared::BitList

  needs bits : BitQuery

  def content
    h3 "#{@current_user.username}"
    bit_list(@bits)
  end
end
