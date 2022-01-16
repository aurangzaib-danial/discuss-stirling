class VotesController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized
  before_action :set_question

  def create
    @question.votes.create(user: current_user)
    set_response
  end

  def destroy
    @vote = @question.user_vote(current_user)
    @vote.destroy
    set_response
  end

  private
  def set_question
    @question = Question.find(params[:question_id])
    authorize @question, :vote?
  end

  def set_response
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(:votes, partial: "votes/votes", locals: {question: @question})
      end
      format.html { redirect_to slug_path(@question) }
    end
  end
end
