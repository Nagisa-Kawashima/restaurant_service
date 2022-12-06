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

end


 