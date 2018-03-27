class CommentsController < ApplicationController

	def new

	end

	def create
		@comment = Comment.create(comment_params)
		# byebug
		# redirect_to 

	end

	private

	def comment_params
		params.require(:comment).permit(:text)
	end
end
