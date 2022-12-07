class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  # フォローするユーザーから見た中間テーブル, フォローする側をrelationshipsと命名、外部キーであるfollower_idを参照する
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # フォローされているユーザーから見た中間テーブル、フォローされる側をreverse_of_relationshipsと命名、外部キーであるfolllowed_idを参照する
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # 中間テーブルrelationshipsを通って、フォローされる側(followed)を集める処理をfollowingsと命名
  # フォローしているユーザーの情報がわかるようになる  @user.followingsのように情報を引き出す
  has_many :followings, through: :relationships, source: :followed
  # 中間テーブルrelationshipsを通って、フォローする側(follower)を集める処理をfollowersと命名
  #フォローされているユーザーの情報がわかるようになる
  has_many :followers, through: :reverse_of_relationships, source: :follower


  # user_roomはuserとroomの間の中間モデル
  has_many :user_rooms
  has_many :chats
  has_many :rooms, through: :user_rooms

 #自分からの通知を送るテーブルをactive_notificationsと命名する、参照先テーブルはNotification、外部キーであるvisitor_idを命名する
  has_many :active_notifications, foreign_key: :visitor_id, class_name: "Notification", dependent: :destroy
  #相手からの通知を受け取ったテーブルをpassive_notificationsと命名する、参照先テーブルはNotification、外部キーであるvisited_idを命名する
  has_many :passive_notifications, foreign_key: :visited_id, class_name: "Notification", dependent: :destroy

  validates :name, presence: true, length: { maximum: 20 }
  validates :email,presence: true
  validates :introduction, length: { in: 1..100 }


# アイコン画像の設定
  has_one_attached :profile_image
  def get_profile_image
    unless profile_image.attached?
      file_path = Rails.root.join("app/assets/images/no_image.jpg")
      product_image.attach(io: File.open(file_path), filename: "no_image.jpg", content_type: "image/jpeg")
    end
    profile_image
  end


#   国名表示の設定
  def counrty 
    Carmen::Country.coded(country_code)
  end
  
  
   #退会ユーザはログインできないようにする,false であればtrueを返す
  def active_for_authentication?
    super && (self.is_deleted == false)
  end
  
  # フォロー機能
  # フォローしたときの処理
  def follow(user_id)
    relationships.create(followed_id: user_id)
  end
  # フォローを外す処理
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destory
  end
  # フォローをしているかの判定
  def following?(user)
    following.include?(user)
  end
  
  # ゲストログイン機能
  def self.guest
    find_or_create_by!(name: 'guestuser', email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = 'guestuser'
    end
  end
  
  
  

end


