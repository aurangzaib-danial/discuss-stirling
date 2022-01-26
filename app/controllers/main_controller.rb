class MainController < ApplicationController
  def index
    if params[:tab] == "most-votes"
      @questions = Question.most_votes
    else
      @questions = Question.recent
    end

    @questions = @questions.page(params[:page])
  end
end
