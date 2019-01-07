class Me::ShowPage < MainLayout
  include Shared::BitList

  needs bits : BitQuery

  def content
    h3 "Email:  #{@current_user.email}"
    bit_list(@bits)
  end
end
