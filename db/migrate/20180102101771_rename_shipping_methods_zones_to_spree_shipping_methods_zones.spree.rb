# This migration comes from spree (originally 20130611054351)
class RenameShippingMethodsZonesToSpreeShippingMethodsZones < ActiveRecord::Migration[5.0]
  def change
    rename_table :shipping_methods_zones, :spree_shipping_methods_zones
  end
end
