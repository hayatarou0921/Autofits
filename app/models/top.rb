class Top < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user

  validates :image, presence: true
end
