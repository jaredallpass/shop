# This migration comes from spree (originally 20150429125822)
class RenameStockTransferReference < ActiveRecord::Migration[5.0]
  def change
    rename_column :spree_stock_transfers, :reference, :description
  end
end
