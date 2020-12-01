class Session < ApplicationRecord
  belongs_to :activity
  belongs_to :instructor

  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
end
