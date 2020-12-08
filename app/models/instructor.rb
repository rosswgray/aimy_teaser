class Instructor < ApplicationRecord
  belongs_to :user
  has_many :sessions

  acts_as_favoritable
  
  has_one_attached :profile_pic
end
