class Feeds::Show < FeedAction
  include AtomResponseHelper
  accepted_formats [:xml]

  get "/feed" do
    bits = BitQuery.for(current_user)
    latest_bit = bits.first
    atom(
      feed do |xml|
        xml.element("title") { xml.text "LinkyBits" }
        xml.element("subtitle") { xml.text "for #{current_user.username}" }
        xml.element(
          "link",
          rel: "alternate",
          type: "text/html",
          href: Me::Show.url
        )
        xml.element(
          "link",
          rel: "self",
          type: "application/atom+xml",
          href: Feeds::Show.url
        )
        xml.element("id") { xml.text Feeds::Show.url }
        xml.element("updated") { xml.text latest_bit.created_at.to_rfc3339 }
        bits.each do |bit|
          atom_entry(bit: bit, xml_context: xml)
        end
      end
    )
  end

  private def feed
    XML.build(encoding: "utf-8") do |xml|
      xml.element("feed", xmlns: "http://www.w3.org/2005/Atom") do
        yield xml
      end
    end
  end

  private def atom_entry(bit : Bit, xml_context xml : XML::Builder)
    xml.element("entry") do
      xml.element("title") { xml.text bit.title }
      xml.element(
        "link",
        rel: "alternate",
        type: "text/html",
        href: bit.url
      )
      if group = bit.group
        xml.element(
          "link",
          rel: "related",
          type: "text/html",
          href: Groups::Bits::Index.url(group)
        )
      end
      xml.element("published") { xml.text bit.created_at.to_rfc3339 }
      xml.element("updated") { xml.text bit.updated_at.to_rfc3339 }
      xml.element("author") do
        xml.element("name") { xml.text bit.user.username }
      end
      xml.element("content", type: "html") do
        xml.text bit.description || ""
      end
    end
  end
end
