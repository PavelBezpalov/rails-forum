class CommentsController < ApplicationController
  before_action :require_login!
  before_action :set_post

  def create
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:notice] = 'Comment added!'
    else
      flash[:alert] = 'Comment not added!'
    end
    redirect_to post_path(@post)
  end

  private
  
  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
