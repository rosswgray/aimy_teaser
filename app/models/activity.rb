class Activity < ApplicationRecord
  belongs_to :organizer, class_name: "User"
  belongs_to :organizer, class_name: "User", foreign_key: :user_id
  has_many :bookings
  
  include PgSearch::Model
  pg_search_scope :global_search,
  against: [:title, :description],
  associated_against: {
    organizer: [:name]
  },
  using: {
      tsearch: { prefix: true },
    }

  
end
