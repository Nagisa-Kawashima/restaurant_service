class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @users = User.all.page(params[:page]).per(7)
  end

  def show
     @user = User.find(params[:id])
  end
  def edit
    @user = User.find(params[:id])
  end

  def destroy
    user = User.find(params[:id])
    image = user.profile_image
    image.destroy
    redirect_to request.referer, notice: "ユーザーのプロフィール画像を削除しました。"

  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to admin_users_path
  end

  def user_params
    params.require(:user).permit(:name,:email, :is_deleted, :country_code, :introduction)
  end
end
