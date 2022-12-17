class Public::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_current_user, only: [:edit, :update,:destroy]

  def new
    @post = Post.new
    # 末尾から5件のレコードを取得
    @tags = Tag.last(5)
  end

  def create
    @post = Post.new(post_params)
    if @post.user_id = current_user.id
      if @post.save
        redirect_to post_path(@post), notice: ((@post.is_draft == "draft") ? "マイページの下書き投稿に保存しました。" : "投稿しました。")
      else
       redirect_to new_post_path(@post), alert: "入力内容をご確認ください。"
      end
    end
  end

  def index
    @post = Post.new
    # Post.publishedとすることで、投稿されたものだけを取得する。(下書きのものを取得しない)
    @posts =  Post.published.order(created_at: :desc).page(params[:page]).per(6)
  end

  def show
    @post = Post.find(params[:id])
    @comment = PostComment.new
    @user = @post.user
  end

  def edit
    @post = Post.find(params[:id])
    @tags = Tag.last(5)
  end

  def update
    @post = Post.find(params[:id])
    if current_user == @post.user
      if @post.update(post_params)
          redirect_to post_path(@post),notice: ((@post.is_draft == "draft") ? "マイページの下書き投稿に保存しました。" : "更新しました。")
      else
        redirect_to edit_post_path(@post), alert: "編集内容をご確認ください。"
      end
    else
      redirect_to posts_path, alert: "本人以外更新できません。"
    end
  end



  def destroy
    @post = Post.find(params[:id])
    if current_user == @post.user
      @post.destroy
      redirect_to post_path, notice: "投稿を保存しました。"
    else
      redirect_to post_path, alert: "本人以外は投稿を削除することが出来ません "
    end
  end


  # 下書き投稿のページ
  def draft_index
    @posts = current_user.posts.draft.reverse_order.page(params[:page]).per(10)

  end

  # タグ検索の一覧ページ
  def tag
    @tag = Tag.find_by(name: params[:name])
    @post = @tag.posts.page(params[:page])
  end




  private

  def post_params
    params.require(:post).permit(:user_id, :title, :explaination, :is_draft, :image)
  end

  def ensure_current_user
    @post = Post.find(params[:id])
    unless @post.user == current_user
      redirect_to posts_path
    end
  end
end
