# This migration comes from spree (originally 20150601191251)
class AddDeletedAtToStockTransfers < ActiveRecord::Migration[5.0]
  def change
    add_column :spree_stock_transfers, :deleted_at, :datetime
  end
end
