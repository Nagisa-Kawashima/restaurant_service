# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
 
  
  
  def after_sign_in_path_for(resource)
    flash[:notice] = "管理者ページにログインしました。"
    admin_users_path
  end
  
  def after_sign_out_path_for(resource)
    flash[:notice] = "管理者ページにログアウトしました。"
    admin_session_path
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


end
