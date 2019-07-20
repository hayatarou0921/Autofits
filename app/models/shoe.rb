class Shoe < ApplicationRecord
  mount_uploader :image, ImageUploader
end
