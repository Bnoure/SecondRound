class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum :role, { buyer: 0, seller: 1}
  has_many :battles, dependent: :destroy
  has_many :stores, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_one_attached :picture
end
