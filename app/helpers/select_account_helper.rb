module SelectAccountHelper
  def select_account_button(type)
    text = "Create #{type.capitalize}"
    options = {class: "btn btn-primary"}
    query_params = {account: type}
    if user_logged_in?
      button_to text, select_account_path(query_params), options.merge(method: :patch)
    else
      link_to text, sign_up_path(query_params), options
    end 
  end
end