class Groups::Bits::NewPage < MainLayout
  needs save_bit : SaveBit
  needs group : Group

  def content
    render_bit_form(@save_bit)
  end

  private def render_bit_form(op : SaveBit)
    form_for Groups::Bits::Create.with(@group.id) do
      field(op.title) { |f| text_input f }
      field(op.url) { |f| text_input f }
      field(op.description) { |f| text_input f }

      div class: "action" do
        submit "Create Bit", flow_id: "create-bit-form-submit"
      end
    end
  end
end
