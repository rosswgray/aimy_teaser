class Booking < ApplicationRecord
  has_one :activity
  has_one :user

end
