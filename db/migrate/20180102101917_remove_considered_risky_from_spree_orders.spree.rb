# This migration comes from spree (originally 20150313140507)
class RemoveConsideredRiskyFromSpreeOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :spree_orders, :considered_risky
  end
end
