require_relative "../modules/doubly_linked_list.rb"

puts ""
puts "Initializing list with #{DoublyLinkedList::FIRST}..."
linked_list = DoublyLinkedList::DoublyLinkedList.new(DoublyLinkedList::FIRST)
linked_list.print
puts ""

puts "Prepending #{DoublyLinkedList::SECOND} to list..."
linked_list.prepend(DoublyLinkedList::SECOND)
linked_list.print
puts ""

puts "Appending #{DoublyLinkedList::THIRD} to list..."
linked_list.append(DoublyLinkedList::THIRD)
linked_list.print
puts ""

puts "Deleting #{DoublyLinkedList::FIRST} from list..."
linked_list.delete(DoublyLinkedList::FIRST)
linked_list.print
puts ""

puts "Deleting #{DoublyLinkedList::THIRD} from list..."
linked_list.delete(DoublyLinkedList::THIRD)
linked_list.print
puts ""

puts "Attempting to delete non-existent #{DoublyLinkedList::FOURTH} from list..."
puts linked_list.delete(DoublyLinkedList::FOURTH)
puts ""

puts "Appending #{DoublyLinkedList::FIFTH} to list..."
linked_list.append(DoublyLinkedList::FIFTH)
linked_list.print
puts ""

puts "Deleting #{DoublyLinkedList::SECOND} from list..."
puts linked_list.delete(DoublyLinkedList::SECOND)
linked_list.print
puts ""

puts "Initializing doubly linked list..."
doubly_linked_list = DoublyLinkedList::DoublyLinkedList.new(DoublyLinkedList::SECOND)
doubly_linked_list.prepend(DoublyLinkedList::FIRST)
doubly_linked_list.append(DoublyLinkedList::THIRD)
doubly_linked_list.append(DoublyLinkedList::FOURTH)
doubly_linked_list.print
puts ""

puts "Deleting head from list..."
doubly_linked_list.delete(DoublyLinkedList::FIRST)
doubly_linked_list.print
puts ""

puts "Deleting #{DoublyLinkedList::THIRD} from list..."
doubly_linked_list.delete(DoublyLinkedList::THIRD)
doubly_linked_list.print
puts ""

puts "Deleting #{DoublyLinkedList::FOURTH} from list..."
doubly_linked_list.delete(DoublyLinkedList::FOURTH)
doubly_linked_list.print
puts ""

puts "Initializing doubly linked list to reverse..."
another_doubly_linked_list = DoublyLinkedList::DoublyLinkedList.new(DoublyLinkedList::SECOND)
another_doubly_linked_list.prepend(DoublyLinkedList::FIRST)
another_doubly_linked_list.append(DoublyLinkedList::THIRD)
another_doubly_linked_list.append(DoublyLinkedList::FOURTH)
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

puts "Deleting all but #{DoublyLinkedList::THIRD} from reversed list..."
another_doubly_linked_list.delete(DoublyLinkedList::FIRST)
another_doubly_linked_list.delete(DoublyLinkedList::SECOND)
another_doubly_linked_list.delete(DoublyLinkedList::FOURTH)
another_doubly_linked_list.print
puts ""

puts "Reversing list of single node..."
another_doubly_linked_list.reverse.print
puts ""

puts "Deleting #{DoublyLinkedList::THIRD} from reversed list..."
another_doubly_linked_list.delete(DoublyLinkedList::THIRD)
another_doubly_linked_list.print
puts "head is nil?: #{another_doubly_linked_list.head.nil?}"
puts "tail is nil?: #{another_doubly_linked_list.tail.nil?}"
puts ""

puts "Reversing empty list..."
puts another_doubly_linked_list.reverse
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
and_another_doubly_linked_list.append(DoublyLinkedList::SECOND)
and_another_doubly_linked_list.append(DoublyLinkedList::THIRD)
and_another_doubly_linked_list.append(DoublyLinkedList::FOURTH)
and_another_doubly_linked_list.each do |node|
  puts "node: #{node.data}"
end
puts ""
