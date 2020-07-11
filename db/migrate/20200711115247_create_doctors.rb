class CreateDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :doctors do |t|
      t.references :user
      t.string :name, null: false
      t.string :specialize

      t.timestamps
    end
  end
end
