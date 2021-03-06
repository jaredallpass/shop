# This migration comes from spree (originally 20130211191120)
class CreateSpreeStockLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :spree_stock_locations do |t|
      t.string :name
      t.belongs_to :address

      t.timestamps null: true
    end
    add_index :spree_stock_locations, :address_id
  end
end
