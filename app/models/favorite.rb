class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :tweet

  validates :user, presence: true
  validates :tweet, presence: true, uniqueness: { scope: :user_id }
end
