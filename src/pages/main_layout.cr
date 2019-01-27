abstract class MainLayout
  include Shared::Layout

  needs current_user : User

  def render
    html_doctype

    html lang: "en" do
      shared_layout_head

      body do
        render_flash
        render_signed_in_user
        content
      end
    end
  end

  private def render_signed_in_user
    nav do
      ul do
        li { link "Home", to: Bits::Index }
        li { link "New Bit", to: Bits::New, flow_id: "new-bit-link" }
        li { link "Follow", to: Follows::Index }
        li { link "My Account", to: Me::Show }
        li { link "Sign Out", to: SignIns::Delete, flow_id: "sign-out-button" }
      end
    end
  end
end
