class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, prepend: true
  helper_method :current_user, :logged_in?

  private
  
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  def require_login!
    return if logged_in?
    redirect_to login_path, alert: 'Please login.'
  end
  
  def already_logged_in!
    redirect_to root_path if logged_in?
  end
end
