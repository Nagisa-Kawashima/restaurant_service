# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :reject_user, only: [:create]
  
  # def guest_sign_in
  #   user = User.guest
  #   sign_in user
  #   redirect_to user_path(user), notice: "ゲストユーザーとしてログインしました。"
  # end

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

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
