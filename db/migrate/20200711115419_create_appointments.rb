class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.references :schedule
      t.references :patient
      t.datetime :book_at
      t.timestamps
    end
  end
end
