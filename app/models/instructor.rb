class Instructor < ApplicationRecord
  belongs_to :user
  has_many :sessions

  has_one_attached :profile_pic
end
