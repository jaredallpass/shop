# This migration comes from spree (originally 20160111091912)
class AddColumnAvailableToAllOnSpreeShippingMethod < ActiveRecord::Migration[5.0]
  def change
    add_column :spree_shipping_methods, :available_to_all, :boolean, default: true
  end
end
