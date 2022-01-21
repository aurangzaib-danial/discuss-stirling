module FollowHelper
  def follow_button(followable)
    form_method = followable.following?(current_user) ? "delete" : "post"
    if form_method == "delete"
      follow = followable.follows.find_by(user: current_user)
      button_text = "Following"
    else
      follow = Follow.new
      button_text = "Follow"
    end
 
    button_to button_text, [followable, follow], method: form_method, class: "btn btn-link align-baseline p-0 text-muted text-decoration-none", form_class: "d-inline", form: { id: follow_id(followable)}
  end

  def follow_id(followable)
    dom_id(followable) + "_follow"
  end
end