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
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
