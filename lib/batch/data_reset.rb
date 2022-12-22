class Batch::DataReset
  def self.data_reset
    # ゲストユーザーの投稿可能なレコードをすべて処理する
    user = User.find_by(email: "guest@example.com")
    user.likes.destroy_all
    user.posts.destroy_all
    user.post_comments.destroy_all
    user.followings.destroy_all
    user.followers.destroy_all
    user.posts.where(is_draft: "draft")
    user.active_notifications.destroy_all
    user.passive_notifications.destroy_all
    p "投稿を全て削除しました"
  end
end