class SubjectsController < ApplicationController
  def show
    @subject = Subject.find(params[:id])

    if params[:tab] == "most-votes"
      @questions = @subject.questions.most_votes
    else
      @questions = @subject.questions.recent
    end

    @questions = @questions.page(params[:page])
  end
end