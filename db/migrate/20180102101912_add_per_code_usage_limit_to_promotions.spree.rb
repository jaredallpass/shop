# This migration comes from spree (originally 20150303212749)
class AddPerCodeUsageLimitToPromotions < ActiveRecord::Migration[5.0]
  def change
    add_column :spree_promotions, :per_code_usage_limit, :integer
  end
end
