class Instructor < ApplicationRecord
  belongs_to :user
  has_many :sessions

  has_one_attached :profile_pic
  
  # in the future, users can favorite instructors
  # acts_as_favoritable
end
