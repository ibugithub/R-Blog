class PostsController < ApplicationController
  
    def index
      user_id = params[:user_id]
      @user = User.find(user_id)
      @posts = @user.posts.includes(:comments)
    end
      
    def show
        user_id = params[:user_id]
        @user = User.find(user_id)
        id = params[:id]
        @posts = @user.posts
        @targated_post = @posts.find(id)
        @comments = @targated_post.comments
    end
end
  