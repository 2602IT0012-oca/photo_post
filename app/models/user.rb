class User < ApplicationRecord
  has_secure_password
  has_many :posts, dependent: :destroy
  has_one_attached :avatar

  validates :name, presence: true, length: { maximum: 20 }
  # メールアドレスのバリデーションを追加
  validates :email, presence: true, uniqueness: true 
end
