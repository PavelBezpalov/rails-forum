class PostsController < ApplicationController
  before_action :require_login, except: [:index, :show]
  before_action :get_post, only: [:show, :edit, :update, :destroy]

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
    # TODO re-render changes url
  end

  def show

  end

  def edit
    redirect_back(fallback_location: posts_path) unless current_user.posts.find_by_id @post.id
  end

  def update
    redirect_to posts_path unless current_user.posts.find_by_id @post.id
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
    # TODO re-render changes url
  end

  def destroy
    if current_user.posts.find_by_id @post.id
      @post.destroy
      redirect_to posts_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def get_post
    @post = Post.find_by_id(params[:id])
    render :missing unless @post
  end
end
