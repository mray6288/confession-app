class CommentsController < ApplicationController

  def create
  	byebug
    @comment = Comment.create(comment_params)
    redirect_to @comment.post
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :confession_id, :user_id)
  end
end
