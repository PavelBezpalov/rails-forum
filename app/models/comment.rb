class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :likes, dependent: :destroy
  
  validates :text, presence: true

  def is_liked_by?(user)
    likes.exists?(user: user)
  end
end
