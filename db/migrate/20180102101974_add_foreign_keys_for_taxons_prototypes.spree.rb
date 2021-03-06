# This migration comes from spree (originally 20151010003252)
class AddForeignKeysForTaxonsPrototypes < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :spree_prototype_taxons, :spree_taxons, column: :taxon_id
    add_foreign_key :spree_prototype_taxons, :spree_prototypes, column: :prototype_id
  end
end
