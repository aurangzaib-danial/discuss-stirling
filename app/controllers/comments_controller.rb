class CommentsController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized, only: [:update, :destroy]

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.commentator = current_user
    
    if @comment.save
      @commentable.notify_followers except: current_user, action: "commented"
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.append("#{dom_id(@commentable)}_comments", partial: "comments/comment", locals: {commentable: @commentable, comment: @comment}) }
      end
    end
  end

  def update
    @comment = @commentable.comments.find(params[:id])
    authorize @comment
    if @comment.update(comment_params)
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace(dom_id(@comment), partial: "comments/comment", locals: {commentable: @commentable, comment: @comment}) }
      end
    end
  end

  def destroy
    @comment = @commentable.comments.find(params[:id])
    authorize @comment
    @comment.destroy
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(dom_id(@comment)) }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end