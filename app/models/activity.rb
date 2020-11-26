class Activity < ApplicationRecord
  belongs_to :organizer, class_name: "User", foreign_key: :user_id
  has_many :bookings
end
