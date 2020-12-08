class RemoveStringsPhotosFromTables < ActiveRecord::Migration[6.0]
  def change
    remove_column :instructors, :profile_pic
    remove_column :activities, :main_photo
    remove_column :activities, :photo_1
    remove_column :activities, :photo_2
    remove_column :activities, :photo_3
  end
end
