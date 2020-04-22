module DoublyLinkedList

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

    def initialize(data=nil)
      @head = nil
      @tail = nil
      set_head_and_tail(data) if data
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
          reset_head_and_tail
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

    def remove
      if @head.nil?
        return "Nothing to remove, empty list"
      else
        removed = @head
        reset_head_and_tail
        removed
      end
    end

    def empty?
      if @head.nil?
        true
      else
        false
      end
    end

    def each
      current = @head

      while current
        node    = current
        current = current.next
        yield node
      end
    end

    def reverse
      if @head.nil?
        cant_reverse_empty_list
      elsif @head.next.nil?
        return self
      else
        current = @tail
        reversed_list = DoublyLinkedList.new(current.data)

        while current.prev != nil
          reversed_list.append(current.prev.data)
          current = current.prev
        end

        reversed_list
      end
    end

    def reverse_by_swap
      if @head.nil?
        cant_reverse_empty_list
      else
        current = @head

        while current != nil
          old_next     = current.next
          current.next = current.prev
          current.prev = old_next
          current      = old_next
        end

        old_tail = @tail
        @tail    = @head
        @head    = old_tail
      end
    end

    def set_head_and_tail(data)
      @head = Node.new(data)
      @tail = @head
    end

    def reset_head_and_tail
      @head = @head.next
      @head.prev = nil if !@head.nil?
      if @head.nil?
        @tail = @head
      end
    end

    def print
      if @head.nil?
        puts "Can't print empty list"
      else
        index = 1

        self.each do |current|
          print_node(index, current)
          index += 1
        end
      end
    end

    private

    def print_node(index, current)
      next_data = current.next ? current.next.data : "nil"
      prev_data = current.prev ? current.prev.data : "nil"

      puts "#{index}: #{current.data} | next: #{next_data} | prev: #{prev_data}"
    end

    def cant_reverse_empty_list
      return "Nothing to reverse, empty list"
    end

  end
end
