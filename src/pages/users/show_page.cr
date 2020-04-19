class Users::ShowPage < MainLayout
  include Shared::BitList

  needs bits : BitQuery
  needs user : User

  private def page_title
    user.username
  end

  def content
    h2 user.username
    bit_list(bits)
  end
end
