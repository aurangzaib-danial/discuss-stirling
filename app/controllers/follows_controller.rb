class FollowsController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized, only: :destroy

  def index
    @questions = current_user.followed_questions.page(params[:page])
  end

  def create
    @followable.follows.create(user: current_user)
    set_response
  end

  def destroy
    @follow = @followable.follows.find_by!(user: current_user)
    authorize(@follow)
    @follow.destroy
    set_response
  end

  private

  def set_response
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(helpers.follow_id(@followable), helpers.follow_button(@followable))
      end
    end
  end
end