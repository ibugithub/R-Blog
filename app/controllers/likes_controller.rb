class LikesController < ApplicationController
  puts '+++++++++++++++++++'
  puts '++++++++++++++++'
  def create
    @post = Post.find(params[:post_id])
    # @like = @post.likes.build(author: current_user)
    @like.increment_like_counter
    p "the likes counter is************", @post
    p "the likes counter is************", @like
    redirect_to user_posts_path
  end
end
