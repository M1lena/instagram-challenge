class PostsController < ApplicationController
# new
  def index
    @posts = Post.all
  end
end
