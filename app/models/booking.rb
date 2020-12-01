class Booking < ApplicationRecord
  belongs_to :session
  belongs_to :parent, class_name: "User", foreign_key: :user_id
  has_one :activity, through: :sessions
end
