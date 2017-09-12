class CreateNodes < ActiveRecord::Migration[5.1]
  def change
    create_table :nodes do |t|
      t.integer :tax_id
      t.integer :parent_tax_id
      t.string :rank

      t.timestamps
    end
  end
end
