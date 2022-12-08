class Public::RelationshipsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    current_user.follow(params[:user_id])
    @user = User.find(params[:user_id])
    #　フォローした際に通知が届くように設定する
    @user.create_notification_follow!(current_user)
    redirect_to request.referer, notice: "フォローしました。"
  end
  
  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer, notice: "フォローを解除しました。"
  end
  
  def followings
    @user = User.find(params[:user_id])
    @users = @user.followings.page(params[:page]).per(5)
  
  end
  
  def followers
    @user = User.find(params[:user_id])
    @user = @user.followers.page(params[:page]).per(5)
  end
  
end
