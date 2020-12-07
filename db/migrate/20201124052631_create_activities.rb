class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.references :user, null: false, foreign_key: true, foreign_key: {on_delete: :cascade}
      t.string :title
      t.string :description
      t.string :main_photo
      t.string :photo_1
      t.string :photo_2
      t.string :photo_3
      t.float :price
      t.float :rating
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
