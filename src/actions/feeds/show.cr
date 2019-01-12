class Feeds::Show < FeedAction
  include AtomResponseHelper

  get "/feed" do
    bits = BitQuery.followed(current_user).preload_user.created_at.desc_order
    latest_bit = BitQuery.followed(current_user).updated_at.desc_order.first
    atom(
      feed do |xml|
        xml.element("title") { xml.text "LinkyBits" }
        xml.element("subtitle") { xml.text "for #{current_user.email}" }
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
      xml.element(
        "link",
        rel: "related",
        type: "text/html",
        href: Bits::Index.url
      )
      xml.element("published") { xml.text bit.created_at.to_rfc3339 }
      xml.element("updated") { xml.text bit.updated_at.to_rfc3339 }
      xml.element("author") do
        xml.element("email") { xml.text bit.user.email }
      end
      xml.element("content", type: "html") do
        xml.text bit.description || ""
      end
    end
  end
end
