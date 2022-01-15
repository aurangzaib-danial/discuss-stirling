class VotesController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized
  def create
    @question = Question.find(params[:id])
    authorize @question, :vote?
    @question.votes.create!(user: current_user)
  end
end
