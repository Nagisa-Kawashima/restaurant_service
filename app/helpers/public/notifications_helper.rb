module Public::NotificationsHelper
  #通知を送ってきたユーザーを取得
  def notification_form(notification)
    @visiter = notification.visiter
    #コメントの内容を通知に表示する
    @comment = nil
    @visiter_comment = notification.comment_id
    # notification.actionがfollowかlikeかcommentかで処理を変える
    case notification.action
    when 'follow'
       #aタグで通知を作成したユーザーshowのリンクを作成
      tag.a(notification.visiter.name, href: user_path(@visiter)) + 'があなたをフォローしました'
    when 'like'
      tag.a(notification.visiter.name, href: user_path(@visiter)) + 'が' + tag.a('あなたの投稿', href: post_path(notification.post_id)) + 'にいいねしました'
    when 'comment' then
      #コメントの内容と投稿のタイトルを取得　  
      @comment = PostComment.find_by(id: @visiter_comment)
      @post_title = @comment.post.title
      tag.a(@visiter.name, href: user_path(@visiter)) + 'が' + tag.a("#{@post_title}", href: post_path(notification.post_id)) + 'にコメントしました'
    end
  end
end

