module Shared::Layout
  macro included
    include Lucky::HTMLPage
    include Shared::FieldErrors
    include Shared::FlashMessages
    include Shared::Field
  end

  abstract def content

  def shared_layout_head
    head do
      utf8_charset
      title decorated_page_title
      css_link asset("css/app.css"), data_turbolinks_track: "reload"
      js_link asset("js/app.js"), defer: "true", data_turbolinks_track: "reload"
      csrf_meta_tags
      responsive_meta_tag
    end
  end

  abstract def page_title

  def page_title
    nil
  end

  def decorated_page_title
    page_title && "#{page_title} - LuckyBits" || default_page_title
  end

  def default_page_title
    "LuckyBits"
  end

  private def shared_footer
    footer do
      span do
        text "Made with "
        a "Lucky", href: "https://luckyframework.org/"
      end
      span { text " | " }
      span do
        a "Open source", href: "https://github.com/edwardloveall/lucky_bits/"
      end
    end
  end

  private def analytics
    tag "script", src: "https://kindmetrics.io/js/track.js", defer: true, "data-domain": "luckybits.link"
  end
end
