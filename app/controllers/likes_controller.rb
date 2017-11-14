class LikesController < ApplicationController
  before_action :require_login
  before_action :get_like

  def create
    unless @like
      @like = Like.new(like_params)
      @like.save
    end
    redirect_back fallback_location: root_path
  end

  def destroy
    @like.destroy if @like
    redirect_back fallback_location: root_path
  end

  private

  def like_params
    { comment_id: params[:comment_id], user_id: current_user.id }
  end

  def get_like
    @like = Like.find_by(like_params)
  end
end
