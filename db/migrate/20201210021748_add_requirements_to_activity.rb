class AddRequirementsToActivity < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :requirements, :text, array: true, default: ["water bottle", "gym shoes"]
  end
end
