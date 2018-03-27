class ConfessionsController < ApplicationController

	def new
		@confession = Confession.new
	end

	def create
		@confession = Confession.new(confession_params)
		@confession.user = current_user
		if @confession.valid?
			@confession.save
			redirect_to @confession
		else
			render :new
		end
	end

	def show
		@confession = Confession.find(params[:id])
		@comment = Comment.new
	end

	private

	def confession_params
		params.require(:confession).permit(:title, :text, topic_attributes:[:text])
	end
end
