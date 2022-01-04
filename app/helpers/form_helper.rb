module FormHelper
  
  # Generates revelant form field.
  # Also, wraps the field with errors 
  # if the object's attribute has any error .
  def custom_field(form, field_type, attribute)
    content_tag :div, class: "mb-3 #{'has-validation' if form.object.errors[attribute].present?}" do
      
      html = <<-HTML
        #{form.label attribute, class: "form-label"}
        #{form.send("#{field_type}_field", attribute, class: "form-control #{ 'is-invalid' if form.object.errors[attribute].present?}", required: true)}
        #{content_tag :div, form.object.errors.where(attribute).first.full_message, class: "invalid-feedback" if form.object.errors[attribute].present?}
      HTML

      html.html_safe
    end
  end
end
