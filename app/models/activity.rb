require 'open-uri'

class Activity < ApplicationRecord
  before_commit :set_default_photo

  belongs_to :organizer, class_name: "User", foreign_key: :user_id
  has_many :sessions, dependent: :destroy
  has_one_attached :main_photo
  has_one_attached :photo_1
  has_one_attached :photo_2
  has_one_attached :photo_3

  acts_as_taggable_on :tags
  acts_as_favoritable

  include PgSearch::Model
  pg_search_scope :global_search,
  against: [:title, :description],
  associated_against: {
    organizer: [:name]
  },
  using: {
    tsearch: { prefix: true }
  }

  def set_default_photo
    photo_1.attach(io: File.open("app/assets/images/no_photo-03.png"), filename: "default.jpg", content_type: "image/jpg") if photo_1.blank?
    photo_2.attach(io: File.open("app/assets/images/no_photo-03.png"), filename: "default.jpg", content_type: "image/jpg") if photo_2.blank?
    photo_3.attach(io: File.open("app/assets/images/no_photo-03.png"), filename: "default.jpg", content_type: "image/jpg") if photo_3.blank?
  end
end
