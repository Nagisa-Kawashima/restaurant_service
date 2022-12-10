class Admin::RelationshipsController < ApplicationController
  # before_action :authenticate_admin!
 
  
  # relationshipsの一覧ページ作成
  def followings
    @user = User.find(params[:user_id])
    @users = @user.followings.page(params[:page]).per(5)
  end
  
  def followers
    @user = User.find(params[:user_id])
    @users = @user.followers.page(params[:page]).per(5)
  end
end
  