FIRST  = "first"
SECOND = "second"
THIRD  = "third"
FOURTH = "fourth"
FIFTH  = "fifth"

class Node
  attr_accessor :next, :prev
  attr_reader   :data

  def initialize(data)
    @data = data
  end
end

class DoublyLinkedList
  attr_reader :head, :tail

  def initialize(data)
    set_head_and_tail(data)
  end

  def prepend(data)
    if @head.nil?
      set_head_and_tail(data)
    else
      old_head = @head
      @head = Node.new(data)
      old_head.prev = @head
      @head.next = old_head
    end
  end

  def append(data)
    # Traverse through linked list until we reach node without next node
    # That's where we want to append node

    if @head.nil?
      set_head_and_tail(data)
    else
      current = @head

      while current.next != nil
        current = current.next
      end

      current.next = Node.new(data)
      current.next.prev = current
      @tail = current.next
    end
  end

  def delete(data)
    # Traverse through linked list until we reach node
    # where next node has data we want to delete

    # These cases are being handled:
    # 1) Delete data at first node
    # 2) Delete data at neither first/last node, somewhere in between
    # 3) Delete data at last node
    # 4) Data can't be found in list

    if @head.nil?
      return "Nothing to delete, empty list"
    else
      current = @head

      if current.data == data
        @head = @head.next
        @head.prev = nil if !@head.nil?
        return "Found node to delete at head so deleting head..."
      end

      # While there are more nodes to search,
      # keep looking for data to delete
      while current.next

        if current.next.data == data

          if current.next == @tail
            @tail = @tail.prev
            @tail.next = nil
            return
          end

          current.next = current.next.next
          current.next.prev = current
          return
        end

        current = current.next
      end

      return "Couldn't find node in list"
    end
  end

  def reverse
    if @head.nil?
      return "Nothing to reverse, empty list"
    elsif @head.next.nil?
      return self
    else
      current = @tail
      reversed_list = DoublyLinkedList.new(current.data)

      while current.prev != nil
        reversed_list.append(current.prev.data)
        current = current.prev
      end

      return reversed_list
    end
  end

  def set_head_and_tail(data)
    @head = Node.new(data)
    @tail = @head
  end

  def print
    if @head.nil?
      puts "Can't print empty list"
    else
      index    = 1
      current  = @head

      while current != nil

        print_node(index, current)

        index  += 1
        current = current.next
      end
    end
  end

  private

  def print_node(index, current)
    next_data = current.next ? current.next.data : "nil"
    prev_data = current.prev ? current.prev.data : "nil"

    puts "#{index}: #{current.data} | next: #{next_data} | prev: #{prev_data}"
  end

end

puts ""
puts "Initializing list with #{FIRST}..."
linked_list = DoublyLinkedList.new(FIRST)
linked_list.print
puts ""

puts "Prepending #{SECOND} to list..."
linked_list.prepend(SECOND)
linked_list.print
puts ""

puts "Appending #{THIRD} to list..."
linked_list.append(THIRD)
linked_list.print
puts ""

puts "Deleting #{FIRST} from list..."
linked_list.delete(FIRST)
linked_list.print
puts ""

puts "Deleting #{THIRD} from list..."
linked_list.delete(THIRD)
linked_list.print
puts ""

puts "Attempting to delete non-existent #{FOURTH} from list..."
puts linked_list.delete(FOURTH)
puts ""

puts "Appending #{FIFTH} to list..."
linked_list.append(FIFTH)
linked_list.print
puts ""

puts "Deleting #{SECOND} from list..."
puts linked_list.delete(SECOND)
linked_list.print
puts ""

puts "Initializing doubly linked list..."
doubly_linked_list = DoublyLinkedList.new(SECOND)
doubly_linked_list.prepend(FIRST)
doubly_linked_list.append(THIRD)
doubly_linked_list.append(FOURTH)
doubly_linked_list.print
puts ""

puts "Deleting head from list..."
doubly_linked_list.delete(FIRST)
doubly_linked_list.print
puts ""

puts "Deleting #{THIRD} from list..."
doubly_linked_list.delete(THIRD)
doubly_linked_list.print
puts ""

puts "Deleting #{FOURTH} from list..."
doubly_linked_list.delete(FOURTH)
doubly_linked_list.print
puts ""

puts "Initializing doubly linked list to reverse..."
another_doubly_linked_list = DoublyLinkedList.new(SECOND)
another_doubly_linked_list.prepend(FIRST)
another_doubly_linked_list.append(THIRD)
another_doubly_linked_list.append(FOURTH)
another_doubly_linked_list.print
puts ""

puts "Reversing list..."
another_doubly_linked_list.reverse.print
puts ""

puts "Deleting all but #{THIRD} from reversed list..."
another_doubly_linked_list.delete(FIRST)
another_doubly_linked_list.delete(SECOND)
another_doubly_linked_list.delete(FOURTH)
another_doubly_linked_list.print
puts ""

puts "Reversing list of single node..."
another_doubly_linked_list.reverse.print
puts ""

puts "Deleting #{THIRD} from reversed list..."
another_doubly_linked_list.delete(THIRD)
another_doubly_linked_list.print
puts ""

puts "Reversing empty list..."
puts another_doubly_linked_list.reverse
puts ""
