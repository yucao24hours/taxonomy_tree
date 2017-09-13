class AddTaxIdToTaxonomies < ActiveRecord::Migration[5.1]
  def change
    add_column :taxonomies, :tax_id, :integer
  end
end
