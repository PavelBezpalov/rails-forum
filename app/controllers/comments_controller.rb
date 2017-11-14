class CommentsController < ApplicationController
  before_action :require_login

  def create
    @post = Post.find_by_id(params[:post_id])
    @comment = Comment.new(post_id: @post.id,
                           user_id: current_user.id,
                           text: comment_params[:text]
                          )
    @comment.save
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
