class User < ApplicationRecord
  has_many :posts
  has_many :likes
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  email_format = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  password_format = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  validates :name, presence: true
  validates :email, format: { with: email_format }
  validates :password, format: { with: password_format }, length: { in: 8..32 }
end