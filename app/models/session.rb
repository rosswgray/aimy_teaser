class Session < ApplicationRecord
  belongs_to :activity
  belongs_to :instructor

  has_many :bookings, dependent: :destroy

  # a session has many parents who book it
  has_many :users, through: :bookings
end
