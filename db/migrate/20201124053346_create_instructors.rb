class CreateInstructors < ActiveRecord::Migration[6.0]
  def change
    create_table :instructors do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.integer :years_experience
      t.date :date_started
      t.string :certifications
      t.boolean :verified
      t.text :blurb

      t.timestamps
    end
  end
end
