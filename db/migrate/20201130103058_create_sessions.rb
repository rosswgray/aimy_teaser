class CreateSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :sessions do |t|
      t.references :activity, null: false, foreign_key: true
      t.references :instructor, null: false, foreign_key: true
      t.string :title
      t.datetime :start_time
      t.datetime :end_time
      t.integer :capactiy
      t.float :price

      t.timestamps
    end
  end
end
