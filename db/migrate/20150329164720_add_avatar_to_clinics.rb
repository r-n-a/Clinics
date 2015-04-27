class AddAvatarToClinics < ActiveRecord::Migration
  def change
    add_column :clinics, :avatar, :string
  end
end
