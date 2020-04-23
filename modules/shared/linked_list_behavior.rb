module LinkedListBehavior

  FIRST  = "first"
  SECOND = "second"
  THIRD  = "third"
  FOURTH = "fourth"
  FIFTH  = "fifth"

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

  def cant_reverse_empty_list
    return puts "Nothing to reverse, empty list"
  end

  def return_self
    puts "Returning self..."
    return self
  end

end
