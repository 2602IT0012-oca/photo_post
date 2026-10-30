class Post < ApplicationRecord
  belongs_to :user
  
  # Active Storageの紐付け
  has_one_attached :image

  # バリデーション
  validates :title, presence: true, length: { maximum: 20 }
  validates :content, length: { maximum: 200 }
  validates :image, presence: true # 投稿には画像が必須
end
