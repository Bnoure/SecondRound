class Store < ApplicationRecord
  belongs_to :user
  has_many :games, dependent: :destroy
  has_one_attached :picture
  validates :name, presence: true
  validates :city, presence: true
  validates :address, presence: true
end
