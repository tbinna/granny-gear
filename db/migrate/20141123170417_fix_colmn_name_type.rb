class FixColmnNameType < ActiveRecord::Migration
  def change
  	rename_column :derailleur_gears, :type, :description
  	rename_column :internal_gear_hubs, :type, :description
  end
end