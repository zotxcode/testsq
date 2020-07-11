class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.references :hospital
      t.references :doctor
      t.datetime :start_at
      t.datetime :end_at
      t.integer :max_patient, default: 0
      t.integer :book_close_in_minute, default: 30
      t.timestamps
    end
  end
end
