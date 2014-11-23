class RenameColumnNameToType < ActiveRecord::Migration
  def change
  	rename_column :derailleur_gears, :name, :type
  	rename_column :internal_gear_hubs, :name, :type
  end
end
