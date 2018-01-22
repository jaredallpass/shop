# This migration comes from spree (originally 20131211112807)
class CreateSpreeOrdersPromotions < ActiveRecord::Migration[5.0]
  def change
    create_table :spree_orders_promotions, id: false do |t|
      t.references :order
      t.references :promotion
    end
  end
end
