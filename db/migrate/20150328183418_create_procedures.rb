class CreateProcedures < ActiveRecord::Migration
  def change
    create_table :procedures do |t|
	  t.integer :clinic_id
      t.string :name
      t.string :cost

      t.timestamps null: false
    end
  end
end
