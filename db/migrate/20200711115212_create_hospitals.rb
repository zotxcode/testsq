class CreateHospitals < ActiveRecord::Migration[6.0]
  def change
    create_table :hospitals do |t|
      t.string :name, null: false
      t.string :address
      t.string :city
      t.string :phone
      t.string :email
      t.timestamps
    end
    add_index(:hospitals, :email, unique: true)
    add_index(:hospitals, :phone, unique: true)
  end
end
