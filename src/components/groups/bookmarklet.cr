class Groups::Bookmarklet < BaseComponent
  needs group : Group

  def render
    text = "Post to #{group.title}"
    a text, href: href(group)
  end

  private def href(group : Group)
    js_intro = "javascript:url=location.href;title=document.title;"
    url = Groups::Bits::New.with(group).url
    page_params = "url='+encodeURIComponent(url)+'&title='+encodeURIComponent(title)"
    window_params = "'bookmark','toolbar=no,scrollbars=yes,width=810,height=490"
    js_window = "void(open('#{url}?#{page_params},#{window_params}'));"
    js_intro + js_window
  end
end
