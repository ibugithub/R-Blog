class PostsController < ApplicationController
  def index
    user_id = params[:user_id]
    @user = User.find(user_id)
    @posts = @user.posts.includes(:comments).paginate(page: params[:page], per_page: 10)
  end

  def show
    user_id = params[:user_id]
    @user = User.find(user_id)
    @posts = @user.posts

    id = params[:id]
    @targated_post = @posts.find(id)
    @comments = @targated_post.comments
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to user_post_path(current_user, @post)
    else
      render :new
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    redirect_to user_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
