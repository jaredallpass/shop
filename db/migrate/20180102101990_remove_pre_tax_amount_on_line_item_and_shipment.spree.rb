# This migration comes from spree (originally 20160301103333)
class RemovePreTaxAmountOnLineItemAndShipment < ActiveRecord::Migration[5.0]
  def change
    remove_column :spree_line_items, :pre_tax_amount, :decimal, precision: 12, scale: 4, default: 0.0, null: false
    remove_column :spree_shipments, :pre_tax_amount, :decimal, precision: 12, scale: 4, default: 0.0, null: false
  end
end
