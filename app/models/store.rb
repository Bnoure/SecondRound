class Store < ApplicationRecord
  belongs_to :user
  has_many :games, dependent: :destroy
  has_one_attached :picture
end
