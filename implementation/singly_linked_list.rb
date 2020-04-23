require_relative "../modules/singly_linked_list.rb"

puts ""
puts "Testing all singly linked list methods..."
puts ""
linked_list = SinglyLinkedList::SinglyLinkedList.new # initialize list without data
linked_list.print
linked_list.prepend(LinkedListBehavior::SECOND)
linked_list.prepend(LinkedListBehavior::FIRST)
linked_list.delete(LinkedListBehavior::SECOND)
linked_list.delete(LinkedListBehavior::SECOND)
linked_list.delete(LinkedListBehavior::FIRST)
linked_list.delete(LinkedListBehavior::FIRST)
linked_list.remove
linked_list.append(LinkedListBehavior::FIRST)
linked_list.remove
linked_list.reverse_using_new_list
linked_list.append(LinkedListBehavior::FIRST)
linked_list.reverse_using_new_list
linked_list.append(LinkedListBehavior::SECOND)
linked_list.append(LinkedListBehavior::THIRD)
linked_list.append(LinkedListBehavior::FOURTH)
linked_list.append(LinkedListBehavior::FIFTH)
puts ""
linked_list.print
puts ""
linked_list.reverse_using_new_list.print
puts ""
SinglyLinkedList::SinglyLinkedList.print_using(linked_list, linked_list.reverse)
puts ""
another_linked_list = SinglyLinkedList::SinglyLinkedList.new(LinkedListBehavior::FIRST) # initialize list with data
another_linked_list.print
puts ""
