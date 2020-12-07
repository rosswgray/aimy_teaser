class Activity < ApplicationRecord
  # belongs_to :organizer, class_name: "User"
  belongs_to :organizer, class_name: "User", foreign_key: :user_id
  has_many :sessions, dependent: :destroy
  has_many :instructors
  has_one_attached :main_photo
  has_one_attached :photo_1
  has_one_attached :photo_2
  has_one_attached :photo_3

  acts_as_taggable_on :tags

  include PgSearch::Model
  pg_search_scope :global_search,
  against: [:title, :description],
  associated_against: {
    organizer: [:name]
  },
  using: {
    tsearch: { prefix: true }
  }
end

# removed from line 5
# , source_type: "Instructor"
