module BitFeed
  def bit_feed(
    bits : BitQuery,
    group : Group,
    last_updated : Time,
    feed_url : String
  )
    feed do |xml|
      xml.element("title") { xml.text "LinkyBits" }
      xml.element("subtitle") { xml.text "for #{group.title}" }
      xml.element(
        "link",
        rel: "alternate",
        type: "text/html",
        href: Groups::Bits::Index.url(group)
      )
      xml.element(
        "link",
        rel: "self",
        type: "application/atom+xml",
        href: feed_url
      )
      xml.element("id") { xml.text feed_url }
      xml.element("updated") { xml.text last_updated.to_rfc3339 }
      bits.each do |bit|
        atom_entry(bit: bit, group: group, xml_context: xml)
      end
    end
  end

  private def feed
    XML.build(encoding: "utf-8") do |xml|
      xml.element("feed", xmlns: "http://www.w3.org/2005/Atom") do
        yield xml
      end
    end
  end

  private def atom_entry(
    bit : Bit,
    group : Group,
    xml_context xml : XML::Builder
  )
    xml.element("entry") do
      xml.element("id") { xml.text tag_uri(bit, group) }
      xml.element("title") { xml.text bit.title }
      xml.element(
        "link",
        rel: "alternate",
        type: "text/html",
        href: Groups::Bits::Index.url(group)
      )
      xml.element(
        "link",
        rel: "related",
        type: "text/html",
        href: URI.encode(bit.url)
      )
      xml.element("published") { xml.text bit.created_at.to_rfc3339 }
      xml.element("updated") { xml.text bit.updated_at.to_rfc3339 }
      xml.element("author") do
        xml.element("name") { xml.text bit.user.username }
      end
      if description = bit.description
        xml.element("content", type: "html") do
          xml.text description
        end
      end
    end
  end

  private def tag_uri(bit : Bit, group : Group)
    url = Groups::Bits::Index.url(group) + "/#{bit.id}"
    url.gsub("#", "/")
    date = bit.created_at.to_s("%Y-%m-%d")
    uri = URI.parse(url)
    "tag:#{uri.host},#{date}:#{uri.path}"
  end
end
