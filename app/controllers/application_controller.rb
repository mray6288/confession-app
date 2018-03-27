class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :logged_in?

  def index
  	redirect_to :signup unless current_user
    @confessions = Confession.all
  end

  def current_user
  	if session[:user_id]
  		@user ||= User.find(session[:user_id])
  	end
  end

  def logged_in?
  	!!current_user
  end

  def authorized
  	if !logged_in?
  		redirect_to 'application#home'
  	end
  end
  
end