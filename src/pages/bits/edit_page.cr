class Bits::EditPage < MainLayout
  needs bit_form : BitForm
  needs bit : Bit

  def content
    render_bit_form(@bit_form)
  end

  private def render_bit_form(form : BitForm)
    form_for Bits::Update.with(@bit.id) do
      field(form.title) { |f| text_input f }
      field(form.url) { |f| text_input f }
      field(form.description) { |f| text_input f }

      div class: "action" do
        submit "Update Bit", flow_id: "bit-form-submit"
      end
    end
  end
end
