class Groups::BookmarkletDescription < BaseComponent
  def render
    para <<-TEXT
      If you want to post to a group from anywhere on the web, you can drag
      this bookmarklet to your bookmarks bar. When you're on a page, click it
      to bring up a way easily post the link.
    TEXT
  end
end
