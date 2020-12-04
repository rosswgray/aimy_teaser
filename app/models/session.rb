class Session < ApplicationRecord
  belongs_to :activity
  belongs_to :instructor

  has_many :bookings, dependent: :destroy

  # a session has many parents who book it
  # uncommenting the below line will break rails_admin for sessions
  # has_many :users, through: :bookings
end

# removed from line 3
# , polymorphic: true
