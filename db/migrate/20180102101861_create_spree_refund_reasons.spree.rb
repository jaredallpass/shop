# This migration comes from spree (originally 20140713140527)
class CreateSpreeRefundReasons < ActiveRecord::Migration[5.0]
  def change
    create_table :spree_refund_reasons do |t|
      t.string :name
      t.boolean :active, default: true
      t.boolean :mutable, default: true

      t.timestamps null: true
    end

    add_column :spree_refunds, :refund_reason_id, :integer
    add_index :spree_refunds, :refund_reason_id, name: 'index_refunds_on_refund_reason_id'
  end
end
