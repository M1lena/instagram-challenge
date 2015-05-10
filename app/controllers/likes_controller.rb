class LikesController < ApplicationController

  def create
    @post = Post.find like_params[:post_id]
    @like = @post.build_like current_user, like_params
    if @like.save
      redirect_to posts_path
    else
      if @like.errors[:user]
        # Note: if you have correctly disabled the like button where appropriate,
        # this should never happen...
        redirect_to posts_path, alert: 'You have already liked this post'
      else
        # Why would we render new again?  What else could cause an error?
        render :new
      end
    end
  end
end
