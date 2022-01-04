module AuthHelper
  

  def facebook_button(text)
    content_tag :div, class: "d-grid mb-4 mt-5" do
      button_tag class: "btn btn-primary" do
        "<i class=\"bi bi-facebook\"></i> #{text}".html_safe
      end
    end
  end

end