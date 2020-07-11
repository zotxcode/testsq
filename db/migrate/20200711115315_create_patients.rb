class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.references :user
      t.string :name, null: false
      t.date :dob
      t.integer :gender
      t.string :phone
      t.timestamps
    end
  end
end
