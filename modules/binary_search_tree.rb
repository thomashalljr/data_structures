class Node
  attr_reader   :data
  attr_accessor :left, :right

  def initialize(data)
    @data = data
  end

  def insert(value)
    if value.eql? data
      false
    elsif value < data
      if left.nil?
        # Include self keyword when calling attribute writer method
        # so ruby doesn't think this is a variable assignment
        self.left = Node.new(value)
      else
        left.insert(value)
      end
    else
      if right.nil?
        self.right = Node.new(value)
      else
        right.insert(value)
      end
    end
  end

  def contains(value)
    if value.eql? data
      true
    elsif value < data
      if left.nil?
        false
      else
        left.contains(value)
      end
    else
      if right.nil?
        false
      else
        right.contains(value)
      end
    end
  end

  # Print left, root, right
  def printInOrder
    if !left.nil?
      left.printInOrder
    end

    puts "data: #{data}, left: #{left ? left.data : "nil"}, right: #{right ? right.data : "nil"}"

    if !right.nil?
      right.printInOrder
    end
  end

  # Print root, left, right
  def printPreOrder
    puts "data: #{data}, left: #{left ? left.data : "nil"}, right: #{right ? right.data : "nil"}"

    if !left.nil?
      left.printInOrder
    end

    if !right.nil?
      right.printInOrder
    end
  end

  # Print left, right, root
  def printPostOrder
    if !left.nil?
      left.printInOrder
    end

    if !right.nil?
      right.printInOrder
    end

    puts "data: #{data}, left: #{left ? left.data : "nil"}, right: #{right ? right.data : "nil"}"
  end

end
