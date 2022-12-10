# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]




  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to user_path(user), notice: "ゲストユーザーとしてログインしました。"
  end

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end
  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end


  protected
  def reject_user
    # ログイン時に入力した名前とパスワードの情報を取得する
    @user = User.find_by(email: params[:user][:email])
    # ログイン時に入力された名前に対応するユーザーが存在しなければ
    return if !@user
    if @user .valid_password?(params[:user][:password]) && @user.is_deleted == true
      flash[:alert] = "退会済みです。再度登録を確認してご利用ください"
      redirect_to new_user_registration_path
    else
      # ログイン時に入力された名前に対応するユーザーが存在していれば
      flash[:notice] = "項目を入力してください"
    end
  end

  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])

  end

end


