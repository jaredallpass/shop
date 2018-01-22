# This migration comes from spree (originally 20140924164824)
class AddCodeToSpreeTaxCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :spree_tax_categories, :tax_code, :string
  end
end
