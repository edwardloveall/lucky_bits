module Shared::FieldErrors
  def errors_for(field : Avram::PermittedAttribute)
    unless field.valid?
      div class: "error" do
        label_text = Wordsmith::Inflector.humanize(field.name.to_s)
        text "#{label_text} #{field.errors.join(", ")}"
      end
    end
  end
end
