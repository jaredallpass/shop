# This migration comes from spree (originally 20160718205341)
class AddPaymentIdIndexToSpreeRefunds < ActiveRecord::Migration[5.0]
  def change
    add_index(:spree_refunds, :payment_id)
  end
end
