require "pry"

ROOT_ID = 1
def create_children(parent_taxonomy:)
  Node.where(parent_tax_id: parent_taxonomy.tax_id).each do |node|
    next if node.tax_id == ROOT_ID

    child_taxonomy = parent_taxonomy.children.create!(
      tax_id: node.tax_id,
      rank: node.rank,
      name: Name.find_by!(tax_id: node.tax_id).name_txt
    )
    create_children(parent_taxonomy: child_taxonomy)
  end
end

root = Node.find_by(tax_id: ROOT_ID)
taxonomy = Taxonomy.create!(
  tax_id: root.tax_id,
  rank: root.rank,
  name: Name.find_by!(tax_id: root.tax_id).name_txt
)
create_children(parent_taxonomy: taxonomy)
