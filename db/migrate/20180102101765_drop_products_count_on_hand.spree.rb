# This migration comes from spree (originally 20130423110707)
class DropProductsCountOnHand < ActiveRecord::Migration[5.0]
  def up
    remove_column :spree_products, :count_on_hand
  end
end
