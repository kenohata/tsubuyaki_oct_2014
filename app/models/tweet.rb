class Tweet < ActiveRecord::Base
  belongs_to :user
  has_many :favorites, dependent: :destroy

  validates :user, presence: true
  validates :content, presence: true

  default_scope -> { order("created_at DESC") }
end
