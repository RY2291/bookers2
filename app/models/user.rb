class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :books, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  #どのカラムを参照するか
  has_many :active_relationships, class_name: "relationships", foreign_key: "follower_id", dependent: :destroy
  #参照したカラムを元に、関連するuser_idも参照できるように
  has_many :following, through: :active_relationships, source: :followed
  
  has_many :passive_relationships, class_name: "relationships", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower
  
  
  attachment :profile_image
  
  validates :name, presence: true, uniqueness: true, length: { in: 2..20 }
  validates :introduction, length: { maximum: 50 }
end
