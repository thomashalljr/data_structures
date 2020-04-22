require_relative "../modules/trie.rb"

root = Node.new("*")

root.add(THOMAS)
root.add(TOMMY)
root.add(TOM)

puts ""
puts "Found #{THOM}: #{root.find(THOM)}"
puts "Found #{THOMAS}: #{root.find(THOMAS)}"
puts "Found #{TOMMY}: #{root.find(TOMMY)}"
puts "Found #{TOM}: #{root.find(TOM)}"
puts ""
