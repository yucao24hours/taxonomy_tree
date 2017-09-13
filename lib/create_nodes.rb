require "pry"

# NOTE: 本番では rake task とかにしたほうがいいと思う

puts "Generating nodes.tsv from nodes.dmp. This may take a while..."
File.open("taxdump/nodes.dmp") do |dmp|
  File.open("taxdump/nodes.tsv", "w+") do |tsv|
    dmp.readlines.each do |row|
      tax_id, parent_tax_id, rank = row.split("|").map {|e| e.strip }
      tsv.puts "#{tax_id}\t#{parent_tax_id}\t#{rank}\t#{Time.now}\t#{Time.now}"
    end
  end
end
puts "nodes.tsv has been generated."

#puts "Import data in hoge.tsv to database..."
#puts "All data have been successfully imported."
