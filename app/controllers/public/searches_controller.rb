class Public::SearchesController < ApplicationController
  # before_action :authenticate_user!



  # Post.searchはPostモデルで定義する
  def search
    @range = params[:range]
    @keyword = params[:keyword]

    if @range == "User"
      @users = User.search(@keyword).page(params[:page])
    else
      @posts = Post.search(@keyword).page(params[:page])
    end
  end
end
