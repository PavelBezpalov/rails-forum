class SessionsController < ApplicationController
  before_action :require_no_login, only: [:login]

  def login
  end

  def create
    @user = User.find_by_email(params[:email])

    if @user
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to posts_path
      else
        flash.now[:password_error] = 'Incorrect password'
        render :login
      end
    else
      flash.now[:email_error] = 'No user with such email found'
      render :login
    end
  end

  def logout
    reset_session
    redirect_to login_path
  end
end
