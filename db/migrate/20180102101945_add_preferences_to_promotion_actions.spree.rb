# This migration comes from spree (originally 20150609193231)
class AddPreferencesToPromotionActions < ActiveRecord::Migration[5.0]
  def change
    add_column :spree_promotion_actions, :preferences, :text
  end
end
