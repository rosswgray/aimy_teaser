class Session < ApplicationRecord
  belongs_to :activity
  belongs_to :instructor

  has_many :bookings, dependent: :destroy
end
