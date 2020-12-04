class Booking < ApplicationRecord
  belongs_to :session
  # belongs_to :parent, class_name: "User", foreign_key: :user_id, polymorphic: true
  belongs_to :user
  has_one :activity, through: :sessions
  has_one :instructor, through: :sessions

  def parent
    User.find(self.user_id)
  end

  def parent=(new_parent)
    self.user = new_parent
  end
end

# removed code
# polymorphic: true,
