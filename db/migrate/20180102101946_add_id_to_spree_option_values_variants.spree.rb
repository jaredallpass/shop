# This migration comes from spree (originally 20150610182638)
class AddIdToSpreeOptionValuesVariants < ActiveRecord::Migration[5.0]
  def change
    add_column :spree_option_values_variants, :id, :primary_key
  end
end
