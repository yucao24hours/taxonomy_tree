class CreateNames < ActiveRecord::Migration[5.1]
  def change
    create_table :names do |t|
      t.integer :tax_id
      t.string :name_txt

      t.timestamps
    end
  end
end
