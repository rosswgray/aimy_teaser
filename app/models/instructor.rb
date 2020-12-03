class Instructor < ApplicationRecord
  belongs_to :user
  has_many :sessions
  has_many :bookings, through: :sessions
  has_many :activities, through: :sessions
end
