module VotesHelper
  def vote_button(question)
    form_method = question.voted?(current_user) ? "delete" : "post"
    if form_method == "delete"
      vote = question.user_vote(current_user)
      button_text = "Voted"
    else
      vote = Vote.new
      button_text = "Vote"
    end

    button_to button_text, [question, vote], method: form_method, class: "btn btn-primary", form_class: "d-inline"
  end
end
