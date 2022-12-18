class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:update, :edit]
  before_action :ensure_guest_user, only: [:edit]


  def show
    @user = User.find(params[:id])
    @posts = @user.posts.published.page(params[:page]).per(4)
  end

  def index
    @users = User.page(params[:page]).per(6)
  end


  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path,
      notice: "ユーザー情報を編集しました。"
    else
      redirect_to edit_user_path(@user),
      alert: "編集内容をご確認ください。"
    end
  end

  def unsubscribe
  end

  def withdraw
    # @user = User.find(params[:id])
    @user = User.find(current_user.id)
    @user.update(is_deleted: true)
    # セッション情報を全て削除する
    reset_session
    flash[:notice] = "退会処理が完了しました。"
    redirect_to root_path
  end

  def follows
    user = User.find(params[:id])
    @users = user.following_user.page(params[:page]).per(5).reverse_order
  end

  def followers
    user = User.find(params[:id])
    @users = user.follower_user.page(params[:page]).per(5).reverse_order
  end

  def likes
    @user = User.find(params[:id])
    # いいねに紐づけられた投稿のレコードをすべて持ってくる
    likes = Like.where(user_id: @user.id).pluck(:post_id)
    @like_posts = Post.find(likes)

  end
  # チャットルームの一覧ページ用
  def chat_rooms
    user_rooms = current_user.rooms
    follow_users = current_user.followers
    @chat_room_users = User.joins(:rooms).where(rooms: { id: user_rooms }).where(id: follow_users).where.not(id: current_user).page(params[:page]).per(5).reverse_order
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :introduction, :is_deleted, :profile_image, :country_code)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to user_path(current_user), notice: "ゲストユーザーはユーザー編集画面へ遷移できません"
    end
  end
end
