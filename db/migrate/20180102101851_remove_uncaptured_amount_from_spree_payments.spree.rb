# This migration comes from spree (originally 20140616202624)
class RemoveUncapturedAmountFromSpreePayments < ActiveRecord::Migration[5.0]
  def change
    remove_column :spree_payments, :uncaptured_amount
  end
end
