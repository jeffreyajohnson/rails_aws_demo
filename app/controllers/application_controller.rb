class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def require_login
    redirect_to '/session/new' if session[:user_id] == nil
  end
  
  def require_correct_user
    user = User.find(params[:id])
    redirect_to "/user/#{current_user.id}" if current_user != user
  end
  
  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

end
