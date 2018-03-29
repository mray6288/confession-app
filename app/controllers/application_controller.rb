class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :logged_in?
  helper_method :current_user

  def index
  	redirect_to '/' unless current_user
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

  def analytics
    @confession_methods = (Confession.methods - ActiveRecord::Base.methods)[0..9]
    @user_methods = [:most_comments, :most_confessions, :longest_username]
    @comment_methods = (Comment.methods - ActiveRecord::Base.methods)
    @topic_methods = [:most_confessions, :alphabetically, :with_multiple_topics]
  end

end
