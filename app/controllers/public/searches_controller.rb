class Public::SearchesController < ApplicationController
  # before_action :authenticate_user!
  
  
  
  # Post.searchはPostモデルで定義する
  def search
    @keyword = params[:keyword]
    @post = Post.search(@keyword).page(params[:page])
  end
end
