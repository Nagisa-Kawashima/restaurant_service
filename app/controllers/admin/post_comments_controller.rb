class Admin::PostCommentsController < ApplicationController
  # before_action :authenticate_admin!
  
  def index
    @user = User.find(params[:user_id])
    @comments = @user.comments
  end
  
  def destroy
    PostComment.find(params[:id]).destory
    redirect_to admin_user_post_comments_path, notice: 'コメントを削除しました。'
  end
end
