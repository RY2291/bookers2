class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  #自分がフォローする側の関係性
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  #自分がフォローしている人を見たい（active_relationshipsを通じてRelationshipテーブルを参照）
  has_many :following, through: :active_relationships, source: :followed
  #自分がフォローされる側の関係性
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :follower, through: :passive_relationships, source: :follower


  # createメソッド（モデルのインスタンス生成と保存を同時に行う）
  def follow(another_user)
    unless self == another_user
      self.active_relationships.find_or_create_by(followed_id: another_user.id)
      #active_relationships.find_or_create_by(followed_id: user_id) user_idだと同じ人をフォローしてしまう
    end
  end

  def unfollow(user_id)
    active_relationships.find_by(followed_id: user_id).destroy
  end

  def following?(another_user)
    self.following.include?(another_user)
  end

  attachment :profile_image

  validates :name, presence: true, uniqueness: true, length: { in: 2..20 }
  validates :introduction, length: { maximum: 50 }
end
