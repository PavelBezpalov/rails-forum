class PostsController < ApplicationController
  before_action :require_login!, except: [:index, :show]
  before_action :get_post, only: [:show, :edit, :update, :destroy]
  before_action :check_author!, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def get_post
    @post = Post.find(params[:id])
  end
  
  def check_author!
    return if current_user.id == @post.user_id
    flash[:alert] = 'You are not an author of the post.'
    redirect_back(fallback_location: posts_path)
  end
end
