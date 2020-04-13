THOM   = "Thom"
THOMAS = "Thomas"
TOMMY  = "Tommy"
TOM    = "Tom"

class Node
  attr_reader :data, :children
  attr_accessor :isCompleteWord

  def initialize(data, isCompleteWord=false)
    @data           = data
    @isCompleteWord = isCompleteWord
    @children       = []
  end

  def add(word)
    current = self
    letters = word.split(//)

    letters.each.with_index do |letter, index|
      child = current.children.find { |node| node.data.eql? letter.downcase }

      if child
        if index.eql? word.length - 1
          child.isCompleteWord = true
          return
        end

        current = child
      else
        is_full_word = false # Create separate variable to distinguish from isCompleteWord getter/setter methods

        if index.eql? word.length - 1
          is_full_word = true
        end

        node = Node.new(letter.downcase, is_full_word)
        current.children << node

        current = node
      end
    end
  end

  def find(word)
    current    = self
    found_word = false
    letters    = word.split(//)

    letters.each.with_index do |letter, index|
      child = current.children.find { |node| node.data.eql? letter.downcase }

      if child
        if index.eql? word.length - 1
          if child.isCompleteWord
            return true
          else
            return false
          end
        end

        current = child
      else
        return false # because word isn't in dictionary
      end
    end
  end
end

root = Node.new("*")

root.add(THOMAS)
root.add(TOMMY)
root.add(TOM)

puts ""
puts "Found #{THOM}: #{root.find(THOM)}"
puts "Found #{THOMAS}: #{root.find(THOMAS)}"
puts "Found #{TOMMY}: #{root.find(TOMMY)}"
puts "Found #{TOM}: #{root.find(TOM)}"
puts ""
