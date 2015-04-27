class CreateClinics < ActiveRecord::Migration
  def change
    create_table :clinics do |t|
      t.integer :user_id
      t.string :name
      t.string :typec
      t.string :adress
      t.string :tel
      t.string :zipcode

      t.timestamps null: false
    end
	add_index :clinics, [:user_id, :created_at]
  end
end
