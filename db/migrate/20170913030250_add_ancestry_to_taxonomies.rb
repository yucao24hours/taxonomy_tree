class AddAncestryToTaxonomies < ActiveRecord::Migration[5.1]
  def change
    add_column :taxonomies, :ancestry, :string
    add_index :taxonomies, :ancestry
  end
end
