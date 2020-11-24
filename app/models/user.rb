class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :activities

  # a customer(parent) has many booked activities
  has_many :bookings

  # an organizer has many booked activities that customers attend
  # has_many :listed_bookings, through: :activities, source: :activities

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
