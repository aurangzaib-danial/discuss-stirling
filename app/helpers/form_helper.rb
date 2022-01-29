module FormHelper
  
  def field_with_errors(form, field_type, attribute, options = {})
    if form.object.errors[attribute].present?
      render "shared/field_with_errors", form: form, field_type: field_type, attribute: attribute, options: options
    else
      form.send(field_type, attribute, {class: "form-control", required: true}.merge(options))
    end
  end


  def button_content(text)
    html = <<-HTML
      <span class="show-when-enabled">#{text}</span>
      <span class="show-when-disabled">Processing...</span>
    HTML
    html.html_safe
  end
end
