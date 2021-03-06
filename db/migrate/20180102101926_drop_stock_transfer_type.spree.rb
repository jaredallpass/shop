# This migration comes from spree (originally 20150424143547)
class DropStockTransferType < ActiveRecord::Migration[5.0]
  def up
    # type is reserved for Single Table Inheritance
    remove_column :spree_stock_transfers, :type
  end

  def down
    add_column :spree_stock_transfers, :type, :string
  end
end
