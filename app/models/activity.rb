class Activity < ApplicationRecord
  belongs_to :organizer, class_name: "User"

  include PgSearch::Model
  pg_search scope :global_search,
  against: [:title, :description],
  associated_against: {
    organizer: [:name]
  }
  using: {
      tsearch: { prefix: true }
    }
end
