# This migration comes from spree (originally 20150213163612)
class AddApproverNameToSpreeOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :spree_orders, :approver_name, :string
  end
end
