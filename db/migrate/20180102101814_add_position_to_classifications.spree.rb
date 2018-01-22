# This migration comes from spree (originally 20131127001002)
class AddPositionToClassifications < ActiveRecord::Migration[5.0]
  def change
    add_column :spree_products_taxons, :position, :integer
  end
end
