# This migration comes from spree (originally 20150331134544)
class AddStockLocationCode < ActiveRecord::Migration[5.0]
  def change
    add_column :spree_stock_locations, :code, :string
  end
end
