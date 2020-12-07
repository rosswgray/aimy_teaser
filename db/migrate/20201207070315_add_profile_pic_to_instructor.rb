class AddProfilePicToInstructor < ActiveRecord::Migration[6.0]
  def change
    add_column :instructors, :profile_pic, :string
  end
end
