# This migration comes from spree (originally 20150514185559)
class AddInvalidatedAtToSpreeStoreCredits < ActiveRecord::Migration[5.0]
  def change
    add_column :spree_store_credits, :invalidated_at, :datetime
  end
end
