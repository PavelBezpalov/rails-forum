class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, prepend: true
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def logged_in?
    current_user != nil
  end

  private

  def require_login
    redirect_to login_path unless logged_in?
  end

  def require_no_login
    redirect_to posts_path if logged_in?
  end
end
