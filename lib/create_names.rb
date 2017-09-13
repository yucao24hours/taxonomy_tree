require "pry"

# NOTE: 本番では rake task とかにしたほうがいいと思う

puts "Generating names.tsv from names.dmp. This may take a while..."
File.open("taxdump/names.dmp") do |dmp|
  File.open("taxdump/names.tsv", "w+") do |tsv|
    dmp.readlines.each do |row|
      tax_id, name_txt, _, name_class = row.split("|").map {|e| e.strip }
      # name class が scientific name という文字列だったらその row を採用する。
      # そうじゃなければいらないのでスキップして次へ
      next unless name_class == "scientific name"

      tsv.puts "#{tax_id}\t#{name_txt}\t#{Time.now}\t#{Time.now}"
    end
  end
end
puts "names.tsv has been generated."

#puts "Import data in hoge.tsv to database..."
#puts "All data have been successfully imported."
