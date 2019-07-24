class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tops, dependent: :destroy
  has_many :trousers, dependent: :destroy
  has_many :shoes, dependent: :destroy
  has_many :outfits, dependent: :destroy

  validates :email, presence: true
end
