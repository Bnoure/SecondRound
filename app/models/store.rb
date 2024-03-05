class Store < ApplicationRecord
  belongs_to :user
  has_many :games
  has_one_attached :picture
end
