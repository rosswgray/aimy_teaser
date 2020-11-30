class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # organizer has many activities
  has_many :activities

  # a customer(parent) has many booked activities
  has_many :bookings

  # an organizer has many booked activities that customers attend
  has_many :bookings_as_organizer, through: :activities, source: :bookings

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
