class UsersController < ApplicationController
  before_action :already_logged_in!, only: [:new]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Success login!'
    else
      flash.now[:alert] = 'Login failed. Read errors.'
      render :new
    end
  end

  private
  
  def user_params
    params.require(:user)
          .permit(:name, :email, :password)
  end
end
