FIRST  = "first"
SECOND = "second"
THIRD  = "third"
FOURTH = "fourth" # Represents non-existent node
FIFTH  = "fifth"

class Node
  attr_accessor :next
  attr_reader   :data

  def initialize(data)
    @data = data
  end
end

class LinkedList
  attr_reader :head

  def initialize(node)
    @head = node
  end

  def prepend(node)
    if @head.nil?
      @head = node
    else
      old_head = @head
      @head = node
      @head.next = old_head
    end
  end

  def append(node)
    # Traverse through linked list until we reach node without next node
    # That's where we want to append node

    if @head.nil?
      @head = node
    else
      current_node = @head

      while current_node.next != nil
        current_node = current_node.next
      end

      current_node.next = node
    end
  end

  def delete(data)
    # Traverse through linked list until we reach node
    # where next node has data that we want to delete

    # These cases are being handled:
    # 1) Delete data that's at first node
    # 2) Delete data that's at neither first/last node, somewhere in between
    # 3) Delete data that's at last node
    # 4) Data can't be found in list

    if @head.nil?
      return "Nothing to delete, empty list"
    else
      current_node = @head

      if current_node.data == data
        @head = @head.next
        return "Found node to delete at head so deleting head..."
      end

      # While there are more nodes to search,
      # keep looking for data to delete
      while (current_node.next && current_node.next.data != data)
        current_node = current_node.next
      end

      if current_node.next.nil?
        return "Couldn't find node in list"
      end

      # If data to delete is found at last node, then just disconnect it from list
      if current_node.next.next.nil?
        current_node.next = nil
      else # Otherwise reconstruct list by setting next node to node after one we want to delete
        current_node.next = current_node.next.next
      end
    end
  end
end

first_node  = Node.new(FIRST)
second_node = Node.new(SECOND)
third_node  = Node.new(THIRD)
fifth_node  = Node.new(FIFTH)

puts ""
puts "Initializing list with #{FIRST} node..."
linked_list = LinkedList.new(first_node)
puts linked_list.head.data # Expect to be first
p    linked_list.head.next # Expect to be nil
puts ""

puts "Prepending #{SECOND} node to list..."
linked_list.prepend(second_node)
puts linked_list.head.data      # Expect to be second
puts linked_list.head.next.data # Expect to be first
p    linked_list.head.next.next # Expect to be nil
puts ""

puts "Appending #{THIRD} node to list..."
linked_list.append(third_node)
puts linked_list.head.data           # Expect to be second
puts linked_list.head.next.data      # Expect to be first
puts linked_list.head.next.next.data # Expect to be third
p    linked_list.head.next.next.next # Expect to be nil
puts ""

puts "Deleting #{FIRST} node from list..."
linked_list.delete(FIRST)
puts linked_list.head.data           # Expect to be second
puts linked_list.head.next.data      # Expect to be third
p    linked_list.head.next.next      # Expect to be nil
puts ""

puts "Deleting #{THIRD} node from list..."
linked_list.delete(THIRD)
puts linked_list.head.data           # Expect to be second
p linked_list.head.next              # Expect to be nil
puts ""

puts "Attempting to delete non-existent #{FOURTH} node from list..."
puts linked_list.delete(FOURTH) # This node is non-existent, should return "Couldn't find node in list"
puts ""

puts "Appending #{FIFTH} node to list..."
linked_list.append(fifth_node)
puts linked_list.head.data      # Expect to be second
puts linked_list.head.next.data # Expect to be fifth
p    linked_list.head.next.next # Expect to be nil
puts ""

puts "Deleting #{SECOND} node from list..."
puts linked_list.delete(SECOND)
puts linked_list.head.data # Expect to be fifth
p    linked_list.head.next # Expect to be nil
puts ""
