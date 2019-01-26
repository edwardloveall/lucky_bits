abstract class GuestLayout
  include Shared::Layout

  def render
    html_doctype

    html lang: "en" do
      shared_layout_head

      body do
        render_flash
        content
      end
    end
  end
end
