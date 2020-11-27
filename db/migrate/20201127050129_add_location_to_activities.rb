class AddLocationToActivities < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :location, :string
  end
end
