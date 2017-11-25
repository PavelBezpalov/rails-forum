class LikesController < ApplicationController
  before_action :require_login!
  before_action :get_comment

  def create
    current_user.liked_comments << @comment
    redirect_back fallback_location: root_path
  end

  def destroy
    current_user.liked_comments.delete(@comment)
    redirect_back fallback_location: root_path
  end

  private

  def get_comment
    @comment = Comment.find(params[:comment_id])
  end
end
