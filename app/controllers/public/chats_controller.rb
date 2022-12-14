class Public::ChatsController < ApplicationController
  before_action :authenticate_user!
  before_action :reject_non_related, only: [:show]


  def show
    # チャットするユーザーの情報を取得する
    @user = User.find(params[:id])
    rooms = current_user.user_rooms.pluck(:room_id)
    # UserRoomモデルからuser_idとroom_idがroomsに一致するレコードを取得して変数に代入する
    user_rooms = UserRoom.find_by(user_id: @user.id, room_id: rooms)
    # user_roomが空でないなら、user_roomsに紐づいたroom が出来る
    unless user_rooms.nil?
      @room = user_rooms.room
    else
    # user_roomsが空であればroomのインスタンスを作成する
      @room = Room.new
      @room.save
      # roomに紐づくUserRoomのレコードを作成する
      # チャットするユーザーの情報とログインユーザーのレコードを作成する
      UserRoom.create(user_id: current_user.id, room_id: @room.id)
      UserRoom.create(user_id: @user.id, room_id: @room.id)
    end
    @chats = @room.chats.order(created_at: "ASC").page(params[:page]).per(20)
    @chat = Chat.new(room_id: @room.id)
  end

  def create
    chat = current_user.chats.new(chat_params)
    if chat.save
      redirect_to request.referer, notice: "メッセージを送信しました。"
    else
      redirect_to request.referer, notice: "メッセージを送信できませんでした。", alert: "入力内容をご確認ください。"
    end
  end

  def destroy
    chat = Chat.find(params[:id])
    chat.destroy
    redirect_to request.referer, notice: "メッセージを削除しました。"
  end

  private

  def chat_params
    params.require(:chat).permit(:message, :room_id)
  end

  def reject_non_related
    user = User.find(params[:id])
    unless current_user.following?(user) && user.following?(current_user)
      redirect_to post_path, alert: "お探しのページは見つかりませんでした。"
    end
  end
end
