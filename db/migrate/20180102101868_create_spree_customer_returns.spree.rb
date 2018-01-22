# This migration comes from spree (originally 20140718133010)
class CreateSpreeCustomerReturns < ActiveRecord::Migration[5.0]
  def change
    create_table :spree_customer_returns do |t|
      t.string :number
      t.integer :stock_location_id
      t.timestamps null: true
    end
  end
end
