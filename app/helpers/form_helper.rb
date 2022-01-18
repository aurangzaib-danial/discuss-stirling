module FormHelper
  
  def field_with_errors(form, field_type, attribute, options = {})
    if form.object.errors[attribute].present?
      render "shared/field_with_errors", form: form, field_type: field_type, attribute: attribute, options: options
    else
      form.send(field_type, attribute, options.merge(class: "form-control", required: true))
    end
  end


  def submit_button(form, text)
    form.button class: "btn btn-primary" do
      html = <<-HTML
        <span class="show-when-enabled">#{text}</span>
        <span class="show-when-disabled">Processing...</span>
      HTML
      html.html_safe
    end
  end
end
