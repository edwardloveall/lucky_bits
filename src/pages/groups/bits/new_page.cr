class Groups::Bits::NewPage < MainLayout
  needs save_bit : SaveBit
  needs group : Group

  private def page_title
    "New Bit"
  end

  def content
    render_bit_form(save_bit)
  end

  private def render_bit_form(op : SaveBit)
    h2 "Post to #{group.title}"
    form_for Groups::Bits::Create.with(group.id) do
      field(op.title) { |field| text_input(field) }
      field(op.url) { |field| text_input(field) }
      field(op.description) { |field| textarea(field) }

      div class: "action" do
        submit "Create Bit", flow_id: "create-bit-form-submit"
      end
    end
  end
end
