class Bits::NewPage < MainLayout
  needs bit_form : BitForm

  def content
    render_bit_form(@bit_form)
  end

  private def render_bit_form(form : BitForm)
    form_for Bits::Create do
      div class: "field" do
        label_and_errors_for(form.title) do |field|
          text_input field
        end
      end

      div class: "field" do
        label_and_errors_for(form.url) do |field|
          text_input field
        end
      end

      div class: "field" do
        label_and_errors_for(form.description) do |field|
          textarea field
        end
      end

      div class: "action" do
        submit "Create Bit"
      end
    end
  end

  private def label_and_errors_for(field)
    label_for field
    yield(field)
    errors_for field
  end
end
