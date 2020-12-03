class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # organizer has many activities
  has_many :activities, foreign_key: :user_id
  has_many :instructors

  # a customer(parent) has many booked activities
  has_many :bookings
  has_many :sessions, through: :bookings, foreign_key: :user_id

  # an organizer has many booked sessions that customers attend
  has_many :bookings_as_organizer, through: :sessions, source: :bookings

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
