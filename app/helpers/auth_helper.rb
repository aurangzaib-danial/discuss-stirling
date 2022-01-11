module AuthHelper
  
  def facebook_button(text)
    button_to user_facebook_omniauth_authorize_path, class: "btn btn-primary", form: { data: {turbo: false}, class: "d-grid mb-4 mt-5"} do
      "<i class=\"bi bi-facebook\"></i> #{text}".html_safe
    end
  end

end