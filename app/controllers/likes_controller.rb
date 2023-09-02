class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.build(author: current_user)

    redirect_to user_posts_path
  end
end
