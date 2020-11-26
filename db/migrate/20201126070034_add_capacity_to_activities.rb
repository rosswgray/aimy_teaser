class AddCapacityToActivities < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :capacity, :integer, default: 10
  end
end
