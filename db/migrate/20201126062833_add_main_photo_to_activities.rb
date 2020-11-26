class AddMainPhotoToActivities < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :main_photo, :string
  end
end
