require "pry"

# ほんとうはたぶん TaxonomyCreator みたいな class を用意するのがいいと思うけど
Node.find_each do |node|
  parent_taxonomy = Taxonomy.find_by(tax_id: node.parent_tax_id)

  # 親 taxonomy がなかったら先に作る
  unless parent_taxonomy
    parent_node = Node.find_by(tax_id: node.parent_tax_id)
    parent_name = Name.find_by(tax_id: node.parent_tax_id).name_txt

    parent_taxonomy = Taxonomy.create!(tax_id: parent_node.tax_id,
                                       rank: parent_node.rank,
                                       name: parent_name)
  end

  name = Name.find_by(tax_id: node.tax_id).name_txt
  parent_taxonomy.children.create!(tax_id: node.tax_id,
                                   rank: node.rank,
                                   name: name)
end
