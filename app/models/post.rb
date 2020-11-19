class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  validates :content, presence: true, length: { maximum: 140 }

  def already_liked?(user)
    self.likes.exists?(user_id: user.id)
  end
end