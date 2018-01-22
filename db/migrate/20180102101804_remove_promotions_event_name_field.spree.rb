# This migration comes from spree (originally 20130917024658)
class RemovePromotionsEventNameField < ActiveRecord::Migration[5.0]
  def change
    remove_column :spree_promotions, :event_name
  end
end
