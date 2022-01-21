class Questions::FollowsController < FollowsController
  before_action :set_followable

  def set_followable
    @followable = Question.find(params[:question_id])
  end
end