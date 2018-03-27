class CommentsController < ApplicationController

	def new

	end

	def create
		# @confession.comments = Comment.create(comment_params)
		@confession = Confession.find(params[:confession_id])
		byebug
        @comment = @confession.comments.create(comment_params)
        redirect_to @confession

	end

	private

	def comment_params
		params.require(:comment).permit(:text)
	end
end
