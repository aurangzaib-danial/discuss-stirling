class QuestionsController < ApplicationController
  before_action :authenticate_user!


  def show
    @question = Question.find(params[:id])
  end

  def ask
    @question = Question.new
  end

  def create
    @question = current_user.questions.build(question_params)

    if @question.save
      redirect_to @question
    else
      render :ask, status: :unprocessable_entity
    end
  end

  private
  def question_params
    params.require(:question).permit(:subject_id, :title, :body)
  end
end
