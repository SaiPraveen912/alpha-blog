class ApplicationController < ActionController::Base
  
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]   # memoization if current_user does not exist it will hit DB once and save the instance
  end

  def logged_in?
    !!current_user       # !! is used to turn to boolean values true or false
  end

end
