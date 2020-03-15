module Shared::FieldErrors
  def errors_for(field : Avram::PermittedAttribute)
    unless field.valid?
      flow_id = "#{field.name.to_s}-error"
      div class: "error", flow_id: flow_id do
        label_text = Wordsmith::Inflector.humanize(field.name.to_s)
        text "#{label_text} #{field.errors.join(", ")}"
      end
    end
  end
end
