class CreateTaxonomies < ActiveRecord::Migration[5.1]
  def change
    create_table :taxonomies do |t|
      t.string :rank, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
