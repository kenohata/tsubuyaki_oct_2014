class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :tweets, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many :follows, foreign_key: :inverse_follower_id
  has_many :followers, through: :follows
  has_many :inverse_follows, foreign_key: :follower_id
  has_many :inverse_followers, through: :inverse_follows

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end
