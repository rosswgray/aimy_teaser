class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :confirmed, default: false
      t.boolean :cancelled, default: false

      t.timestamps
    end
  end
end
