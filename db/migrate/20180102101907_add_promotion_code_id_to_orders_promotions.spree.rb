# This migration comes from spree (originally 20150213160148)
class AddPromotionCodeIdToOrdersPromotions < ActiveRecord::Migration[5.0]
  def change
    add_column :spree_orders_promotions, :promotion_code_id, :integer
    add_index :spree_orders_promotions, :promotion_code_id
    add_column :spree_orders_promotions, :id, :primary_key
  end
end
