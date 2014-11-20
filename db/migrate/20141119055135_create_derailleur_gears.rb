class CreateDerailleurGears < ActiveRecord::Migration
  def change
    create_table :derailleur_gears do |t|
      t.string :name
      t.text :chainring
      t.text :cassette
    end
  end
end
