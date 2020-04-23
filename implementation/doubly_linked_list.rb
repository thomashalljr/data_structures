require_relative "../modules/doubly_linked_list.rb"

puts ""
puts "Initializing list with #{LinkedListBehavior::FIRST}..."
linked_list = DoublyLinkedList::DoublyLinkedList.new(LinkedListBehavior::FIRST)
linked_list.print
puts ""

puts "Prepending #{LinkedListBehavior::SECOND} to list..."
linked_list.prepend(LinkedListBehavior::SECOND)
linked_list.print
puts ""

puts "Appending #{LinkedListBehavior::THIRD} to list..."
linked_list.append(LinkedListBehavior::THIRD)
linked_list.print
puts ""

puts "Deleting #{LinkedListBehavior::FIRST} from list..."
linked_list.delete(LinkedListBehavior::FIRST)
linked_list.print
puts ""

puts "Deleting #{LinkedListBehavior::THIRD} from list..."
linked_list.delete(LinkedListBehavior::THIRD)
linked_list.print
puts ""

puts "Attempting to delete non-existent #{LinkedListBehavior::FOURTH} from list..."
puts linked_list.delete(LinkedListBehavior::FOURTH)
puts ""

puts "Appending #{LinkedListBehavior::FIFTH} to list..."
linked_list.append(LinkedListBehavior::FIFTH)
linked_list.print
puts ""

puts "Deleting #{LinkedListBehavior::SECOND} from list..."
puts linked_list.delete(LinkedListBehavior::SECOND)
linked_list.print
puts ""

puts "Initializing doubly linked list..."
doubly_linked_list = DoublyLinkedList::DoublyLinkedList.new(LinkedListBehavior::SECOND)
doubly_linked_list.prepend(LinkedListBehavior::FIRST)
doubly_linked_list.append(LinkedListBehavior::THIRD)
doubly_linked_list.append(LinkedListBehavior::FOURTH)
doubly_linked_list.print
puts ""

puts "Deleting head from list..."
doubly_linked_list.delete(LinkedListBehavior::FIRST)
doubly_linked_list.print
puts ""

puts "Deleting #{LinkedListBehavior::THIRD} from list..."
doubly_linked_list.delete(LinkedListBehavior::THIRD)
doubly_linked_list.print
puts ""

puts "Deleting #{LinkedListBehavior::FOURTH} from list..."
doubly_linked_list.delete(LinkedListBehavior::FOURTH)
doubly_linked_list.print
puts ""

puts "Initializing doubly linked list to reverse..."
another_doubly_linked_list = DoublyLinkedList::DoublyLinkedList.new(LinkedListBehavior::SECOND)
another_doubly_linked_list.prepend(LinkedListBehavior::FIRST)
another_doubly_linked_list.append(LinkedListBehavior::THIRD)
another_doubly_linked_list.append(LinkedListBehavior::FOURTH)
another_doubly_linked_list.print
puts ""

# Serialize/deserialize binary character stream to deep dup
and_another_doubly_linked_list = Marshal.load( Marshal.dump(another_doubly_linked_list) )

puts "Reversing list..."
another_doubly_linked_list.reverse.print
puts ""

puts "Reversing list by swap method..."
and_another_doubly_linked_list.reverse_by_swap
and_another_doubly_linked_list.print
puts ""

puts "Deleting all but #{LinkedListBehavior::THIRD} from reversed list..."
another_doubly_linked_list.delete(LinkedListBehavior::FIRST)
another_doubly_linked_list.delete(LinkedListBehavior::SECOND)
another_doubly_linked_list.delete(LinkedListBehavior::FOURTH)
another_doubly_linked_list.print
puts ""

puts "Reversing list of single node..."
another_doubly_linked_list.reverse.print
puts ""

puts "Deleting #{LinkedListBehavior::THIRD} from reversed list..."
another_doubly_linked_list.delete(LinkedListBehavior::THIRD)
another_doubly_linked_list.print
puts "head is nil?: #{another_doubly_linked_list.head.nil?}"
puts "tail is nil?: #{another_doubly_linked_list.tail.nil?}"
puts ""

puts "Reversing empty list..."
another_doubly_linked_list.reverse
puts ""

puts "Removing node from head of list..."
and_another_doubly_linked_list.remove
and_another_doubly_linked_list.print
puts ""

puts "Removing so there's only one node..."
and_another_doubly_linked_list.remove
and_another_doubly_linked_list.remove
and_another_doubly_linked_list.print
puts ""

puts "Checking if list is empty..."
puts and_another_doubly_linked_list.empty?
puts ""

puts "Removing so it's an empty list..."
and_another_doubly_linked_list.remove
and_another_doubly_linked_list.print
puts "head is nil?: #{and_another_doubly_linked_list.head.nil?}"
puts "tail is nil?: #{and_another_doubly_linked_list.tail.nil?}"
puts ""

puts "Checking if list is empty..."
puts and_another_doubly_linked_list.empty?
puts ""

puts "Trying to remove from empty list..."
puts and_another_doubly_linked_list.remove
puts ""

puts "Testing method each on empty list (should print nothing)..."
and_another_doubly_linked_list.each do |node|
  puts node
end
puts ""

puts "Testing method each on non-empty list..."
and_another_doubly_linked_list.append(LinkedListBehavior::SECOND)
and_another_doubly_linked_list.append(LinkedListBehavior::THIRD)
and_another_doubly_linked_list.append(LinkedListBehavior::FOURTH)
and_another_doubly_linked_list.each do |node|
  puts "node: #{node.data}"
end
puts ""
