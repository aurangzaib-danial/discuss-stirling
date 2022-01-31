class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized, only: [:edit, :update, :destroy]


  def index
    @questions = current_user.questions.page(params[:page])
  end 

  def ask
    @question = Question.new
  end

  def show
  end

  def create
    @question = current_user.questions.build(question_params)

    if @question.save
      redirect_to slug_path(@question)
    else
      render :ask, status: :unprocessable_entity
    end
  end

  def edit
    authorize @question
  end

  def update
    authorize @question
    if @question.update(question_params)
      redirect_to slug_path(@question)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @question
    @question.destroy
    redirect_to root_path, notice: "Question deleted"
  end

  private
  def question_params
    params.require(:question).permit(:subject_id, :title, :body)
  end
  def set_question
    @question = Question.find(params[:id])
  end
end
