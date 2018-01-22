# This migration comes from spree (originally 20130318151756)
class AddSourceAndDestinationToStockMovements < ActiveRecord::Migration[5.0]
  def change
    change_table :spree_stock_movements do |t|
      t.references :source, polymorphic: true
      t.references :destination, polymorphic: true
    end
  end
end
