class Admin::TagsController < ApplicationController

  before_action :authenticate_admin!
     before_action :tag_choice, only: [:edit, :update, :destroy]
  def new
    @tag = Tag.new
    @tags = Tag.all.order(created_at: "DESC").page(params[:page]).per(15)
  end

  def create
    tag = Tag.new(tag_params)
    if tag.save
      redirect_to request.referer, notice: "タグを新規登録しました。"
    else
      redirect_to request.referer, alert: "タグ登録に失敗しました。"
    end
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    if @tag.update(tag_params)
      redirect_to new_admin_tag_path, notice: "ハッシュタグ名を更新しました。"
    else
      redirect_to request.referer, alert: "編集内容をご確認ください。"
    end
  end

  def destroy
    @tag.destroy
    redirect_to request.referer, notice: "ハッシュタグを削除しました。"
  end

  private
    def tag_params
      params.require(:tag).permit(:name)
    end

    def tag_choice
      @tag = Tag.find(params[:id])
    end
end
