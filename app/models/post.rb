class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  # PostTagは中間モデル
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  has_many :notifications, dependent: :destroy


  validates :title, presence: true, length: { maximum: 50 }
  validates :explaination, presence: true, length: { minimum: 1, maximum: 1000 }
  
  # 投稿画像設定
  has_one_attached :image
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_post_image.jpg')
      image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/png')
    end
      image
  end

  #下書き機能  公開中 /published,下書き  /draft 
  enum is_draft: { draft: 0, published: 1 }



  # いいね機能
  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end
  
  # ハッシュタグ機能
  #DBへのコミット直前に実施する
  after_create do
    post = Post.find_by(id: self.id)
    tags = self.content.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    post.tags = []
    tags.uniq.map do |tag|
       #ハッシュタグは先頭の'#'を外した上で保存
      tag = Tag.find_or_create_by(name: tag.downcase.delete('#'))
      post.tags << tag
    end
  end
  
  before_update do
    post = Post.find_by(id: self.id)
    post.tags.clear
    tags = self.content.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    tags.uniq.map do |tag|
      tag = Tag.find_or_create_by(name: tag.downcase.delete('#'))
      post.tags << tag
    end
  end
  
  
  
end


 