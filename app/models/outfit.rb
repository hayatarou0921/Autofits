class Outfit < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :top_id, presence: true
  validates :trouser_id, presence: true
  validates :shoe_id, presence: true
end
