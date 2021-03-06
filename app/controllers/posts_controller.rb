class PostsController < ApplicationController
  # before_action :authenticate_user!, :except => [:index, :show]
# new
  def index
    @posts = Post.all
    @new_post = new_post_path
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
    redirect_to '/posts'
  end

  def post_params
    params.require(:post).permit(:message, :image)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to '/posts'
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = 'post deleted successfully'
    redirect_to '/posts'
  end
end
