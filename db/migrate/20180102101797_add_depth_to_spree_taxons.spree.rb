# This migration comes from spree (originally 20130826062534)
class AddDepthToSpreeTaxons < ActiveRecord::Migration[5.0]
  def up
    add_column :spree_taxons, :depth, :integer

    say_with_time 'Update depth on all taxons' do
      Spree::Taxon.reset_column_information
      Spree::Taxon.all.each(&:save)
    end
  end

  def down
    remove_column :spree_taxons, :depth
  end
end
