class Public::NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = current_user.passive_notifications.page(params[:page]).per(20)
    #通知画面を開くとcheckedをtrueにして通知確認済にする
    @notifications.where(checked: false).each do |notification|
      notification.update(checked: true)
    end
  end
  # 未確認の通知レコードを一括削除する
  def destroy
    @notifications = current_user.passive_notifications.destroy_all
    redirect_to notifications_path
  end

end



