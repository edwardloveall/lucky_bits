abstract class GuestLayout
  include Shared::Layout

  def render
    html_doctype

    html lang: "en" do
      shared_layout_head

      body do
        render_flash
        main id: "main-content" do
          content
        end
        shared_footer
      end
    end
  end
end
