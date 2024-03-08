class Console < ApplicationRecord
  has_many :games, dependent: :destroy
  has_one_attached :picture
end
