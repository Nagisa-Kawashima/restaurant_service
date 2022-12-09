class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.page(params[:page]).per(6)
  end

  def show
    @post = Post.find(params[:id])
    @comment = PostComment.new
    @user_post = @post.user
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to admin_user_posts_path, notice: "投稿を削除しました。"
  end


end
