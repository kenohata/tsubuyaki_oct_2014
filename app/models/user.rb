class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :tweets, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end
