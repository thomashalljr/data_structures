require_relative "./shared/linked_list_behavior.rb"

module SinglyLinkedList

  class Node
    attr_accessor :next
    attr_reader   :data

    def initialize(data)
      @data = data
    end
  end

  class SinglyLinkedList
    include LinkedListBehavior

    attr_reader :head

    def initialize(data=nil)
      @head = nil
      set_head(data) if data
    end

    #------------------#
    # Instance methods #
    #------------------#

    def prepend(data)
      if @head.nil?
        set_head(data)
      else
        old_head = @head
        @head = Node.new(data)
        @head.next = old_head
      end
    end

    def append(data)
      # Traverse through linked list until we reach node without next node
      # That's where we want to append node

      if @head.nil?
        set_head(data)
      else
        current = @head

        while current.next != nil
          current = current.next
        end

        current.next = Node.new(data)
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
        return puts "Nothing to delete, empty list"
      else
        current = @head

        if current.data == data
          delete_head
          return puts "Found node to delete at head so deleting head..."
        end

        # While there are more nodes to search,
        # keep looking for data to delete
        while current.next

          if current.next.data == data
            current.next = current.next.next
            return
          end

          current = current.next
        end

        return puts "Couldn't find node in list"
      end
    end

    def remove
      if @head.nil?
        return puts "Nothing to remove, empty list"
      else
        removed = @head
        delete_head
        removed
      end
    end

    def reverse_using_new_list
      if @head.nil?
        cant_reverse_empty_list
      elsif @head.next.nil?
        return_self
      else
        current  = @head
        reversed = SinglyLinkedList.new

        while current
          reversed.prepend(current.data)
          current = current.next
        end

        reversed
      end
    end

    def reverse
      if @head.nil?
        cant_reverse_empty_list
      elsif @head.next.nil?
        return_self
      else
        current = @head
        previous = nil

        while current
          next_node    = current.next
          # Below works when previous is nil because first node will be
          # last node and last node's next should be nil
          current.next = previous
          previous     = current
          current      = next_node
        end

        previous # new head
      end
    end

    def set_head(data)
      @head = Node.new(data)
    end

    def delete_head
      @head = @head.next
    end

    #---------------#
    # Class methods #
    #---------------#

    def self.print_using(list, node)
      current = node
      index   = 1

      while current
        list.send(:print_node, index, current)
        current = current.next
        index  += 1
      end
    end

    #-----------------#
    # Private methods #
    #-----------------#

    private

    def print_node(index, current)
      next_data = current.next ? current.next.data : "nil"

      puts "#{index}: #{current.data} | next: #{next_data}"
    end

  end
end
