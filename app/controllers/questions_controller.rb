class QuestionsController < ApplicationController
  before_action :authenticate_user!

  def ask
    @question = Question.new
  end
end
