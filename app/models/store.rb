class Store < ApplicationRecord
  belongs_to :user
  has_many :games
  has_one_attached :picture
  Validates :name, presence: true
  Validates :city, presence: true
  Validates :address, presence: true
end
