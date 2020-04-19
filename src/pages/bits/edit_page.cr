class Bits::EditPage < MainLayout
  needs save_bit : SaveBit
  needs bit : Bit

  private def page_title
    "Edit"
  end

  def content
    render_bit_form(save_bit)
  end

  private def render_bit_form(op : SaveBit)
    form_for Bits::Update.with(bit.id) do
      field(op.title) { |f| text_input f }
      field(op.url) { |f| text_input f }
      field(op.description) { |f| text_input f }

      div class: "action" do
        submit "Update Bit", flow_id: "bit-form-submit"
      end
    end
  end
end
