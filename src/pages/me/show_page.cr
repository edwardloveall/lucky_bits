class Me::ShowPage < MainLayout

  def content
    h3 "#{@current_user.username}"
  end
end
