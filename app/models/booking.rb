class Booking < ApplicationRecord
  belongs_to :activity
  belongs_to :parent, class_name: "User" 

end
