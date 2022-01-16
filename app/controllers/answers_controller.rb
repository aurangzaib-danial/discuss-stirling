class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_answer, only: [:edit, :update]
  after_action :verify_authorized, except: :create

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(answer_params)
    @answer.user = current_user

    respond_to do |format|
      if @answer.save
        format.turbo_stream
        format.html { redirect_to slug_path(@question), notice: "Answer posted!" }
      else
        format.html { redirect_to slug_path(@question), alert: "Body for answer is missing" }
      end
    end
  end

  def update
    @answer.update!(answer_params)
    redirect_to slug_path(@question)
  end

  private

  def answer_params
   params.require(:answer).permit(:body)
  end

  def set_answer
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    authorize @answer
  end
end