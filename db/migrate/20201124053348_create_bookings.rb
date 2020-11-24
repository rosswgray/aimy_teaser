class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.user :references
      t.activity :references
      t.boolean :confirmed

      t.timestamps
    end
  end
end
