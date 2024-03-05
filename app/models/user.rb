class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum :role, { buyer: 0, seller: 1}
  has_many :battles
  has_many :stores
  has_many :bookings
  has_one_attached :picture
end
