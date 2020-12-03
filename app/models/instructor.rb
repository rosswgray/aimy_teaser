class Instructor < ApplicationRecord
  belongs_to :user
  has_many :sessions

  acts_as_favoritable
end
