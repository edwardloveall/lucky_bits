class Bits::NewPage < MainLayout
  needs bit_form : BitForm

  def content
    render_bit_form(@bit_form)
  end

  private def render_bit_form(form : BitForm)
    form_for Bits::Create do
      field(form.title) { |f| text_input f }
      field(form.url) { |f| text_input f }
      field(form.description) { |f| text_input f }

      div class: "action" do
        submit "Create Bit", flow_id: "create-bit-form-submit"
      end
    end
  end
end
