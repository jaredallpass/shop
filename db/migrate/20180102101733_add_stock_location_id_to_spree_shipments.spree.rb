# This migration comes from spree (originally 20130226191231)
class AddStockLocationIdToSpreeShipments < ActiveRecord::Migration[5.0]
  def change
    add_column :spree_shipments, :stock_location_id, :integer
  end
end
