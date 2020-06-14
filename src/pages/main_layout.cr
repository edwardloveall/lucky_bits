abstract class MainLayout
  include Shared::Layout

  needs current_user : User

  def render
    html_doctype

    html lang: "en" do
      shared_layout_head

      body do
        skip_to_content_link
        render_flash
        render_signed_in_user
        main id: "main-content" do
          content
        end
        shared_footer
        analytics
      end
    end
  end

  private def render_signed_in_user
    nav flow_id: "main-nav" do
      ul do
        li { link "Home", to: Bits::Index, flow_id: "bits-index" }
        li { link "My Bits", to: Bits::Index }
        li { link "Groups", to: Groups::Index, flow_id: "main-group-nav" }
        li { link "Account", to: Me::Show, flow_id: "nav-account" }
        li { link "Sign Out", to: SignIns::Delete, flow_id: "sign-out-button" }
      end
    end
  end

  private def skip_to_content_link
    a "Skip to content", href: "#main-content", class: "skip-to-main"
  end
end
