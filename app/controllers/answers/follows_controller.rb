class Answers::FollowsController < FollowsController
  before_action :set_followable

  def set_followable
    @followable = Answer.find(params[:answer_id])
  end
end