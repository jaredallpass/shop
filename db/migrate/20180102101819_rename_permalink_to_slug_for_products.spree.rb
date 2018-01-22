# This migration comes from spree (originally 20140106224208)
class RenamePermalinkToSlugForProducts < ActiveRecord::Migration[5.0]
  def change
    rename_column :spree_products, :permalink, :slug
  end
end
