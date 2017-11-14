class User < ApplicationRecord
  has_secure_password
  has_many :posts
  has_many :likes
  has_many :liked_comments, through: :likes, source: :comment
  validates :name, presence: true
  validates :email,
            format: /\A[a-z0-9]+@[a-z0-9]+\.[a-z0-9]+\z/i,
            presence: true,
            uniqueness: true
end