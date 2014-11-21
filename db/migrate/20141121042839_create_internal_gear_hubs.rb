class CreateInternalGearHubs < ActiveRecord::Migration
  def change
    create_table :internal_gear_hubs do |t|
      t.string :name
      t.text :gear_ratio
      t.integer :chainring
      t.integer :sprocket
    end
  end
end
