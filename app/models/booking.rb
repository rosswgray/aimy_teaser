class Booking < ApplicationRecord
  belongs_to :session
  # belongs_to :user
  belongs_to :parent, class_name: "User", polymorphic: true, foreign_key: :user_id
  has_one :activity, through: :sessions
  has_one :instructor, through: :sessions
end
