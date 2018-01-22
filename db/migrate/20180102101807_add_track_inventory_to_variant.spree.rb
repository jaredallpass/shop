# This migration comes from spree (originally 20131026154747)
class AddTrackInventoryToVariant < ActiveRecord::Migration[5.0]
  def change
    add_column :spree_variants, :track_inventory, :boolean, default: true
  end
end
