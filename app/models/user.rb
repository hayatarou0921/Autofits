class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tops
  has_many :trousers
  has_many :shoes
  has_many :outfits

  validates :email, presence: true
end
