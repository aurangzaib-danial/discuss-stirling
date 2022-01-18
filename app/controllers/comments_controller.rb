class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = @commentable.comments.new comment_params
    @comment.commentator = current_user
    @comment.save
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.append("comments", partial: "comments/comment", locals: {comment: @comment}) }
      format.html { redirect_to @commentable, notice: "Your comment was successfully posted." }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end