# This migration comes from spree (originally 20151015203732)
class AddForeignKeysForProductPromotionRules < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :spree_product_promotion_rules, :spree_products,
                    column: :product_id

    add_foreign_key :spree_product_promotion_rules, :spree_promotion_rules,
                    column: :promotion_rule_id
  end
end
