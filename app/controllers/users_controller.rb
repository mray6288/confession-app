class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.valid?
			@user.save
			session[:user_id] = @user.id
			redirect_to @user
		else
			redirect_to '/signup'
		end
	end

	def show
		# byebug
		@user = User.find(session[:user_id])
	end

	private

	def user_params
		params.require(:user).permit(:username, :password, :password_confirmation)
	end

end
