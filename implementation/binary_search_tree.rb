require_relative "../modules/binary_search_tree.rb"

root = Node.new(12)

1.upto(10) do
  root.insert( rand(1..20) )
end

puts ""
puts "BST printed in-order..."
root.printInOrder
puts ""

puts "BST printed pre-order..."
root.printPreOrder
puts ""

puts "BST printed post-order..."
root.printPostOrder
puts ""

puts "Found in tree results..."

1.upto(10) do
  rand = rand(1..20)
  puts "#{rand} " + root.contains( rand ).to_s
end

puts ""
