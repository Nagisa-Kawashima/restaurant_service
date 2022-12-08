class Public::PostCommentsController < ApplicationController
  # before_action :authenticate_user!
  
  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.post_comments.new(post_comment_params)
    @comment.post_id = @post.id
    if @comment.save
      # コメントしたことを通知する
      @post.create_notification_comment!(current_user, @comment.id)
    else
      redirect_to post_path(@post), alert: "入力内容をご確認ください。"
    end
    @comment = PostComment.new
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    @comment = PostComment,new
    PostComment.find(params[:id]).destroy
  end

  private
  
  def post_comment_params
    params.require(:post_comment).permit(:comment, :user_id, :post_id)
  end
  
end
