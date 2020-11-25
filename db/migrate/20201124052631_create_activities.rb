class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :description
      t.string :photos
      t.float :price
      t.float :rating
      t.date :date
      t.integer :start_time
      t.integer :end_time

      t.timestamps
    end
  end
end
