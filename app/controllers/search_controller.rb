class SearchController < ApplicationController
  def index
    @questions = Question.recent.page(params[:page])
  end
end