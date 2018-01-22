# This migration comes from spree (originally 20150626200816)
class RemoveShippingMethodIdFromSpreeOrders < ActiveRecord::Migration[5.0]
  def up
    remove_column :spree_orders, :shipping_method_id, :integer
  end

  def down
    add_column :spree_orders, :shipping_method_id, :integer
  end
end
