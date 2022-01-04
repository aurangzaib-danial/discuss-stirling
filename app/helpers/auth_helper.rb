module AuthHelper
  
  def facebook_button(text)
    button_to '/auth/facebook', class: "btn btn-primary", form: { data: {turbo: false}, class: "d-grid mb-4 mt-5"} do
      "<i class=\"bi bi-facebook\"></i> #{text}".html_safe
    end
  end

end