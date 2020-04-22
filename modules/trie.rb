THOM   = "Thom"
THOMAS = "Thomas"
TOMMY  = "Tommy"
TOM    = "Tom"

class Node
  attr_reader :data, :children
  attr_accessor :is_complete_word

  def initialize(data, is_complete_word=false)
    @data             = data
    @is_complete_word = is_complete_word
    @children         = []
  end

  def add(word)
    current = self
    letters = word.split(//)

    letters.each.with_index do |letter, index|
      child = current.children.find { |node| node.data.eql? letter.downcase }

      if child
        if index.eql? word.length - 1
          child.is_complete_word = true
          return
        end

        current = child
      else
        is_full_word = false # Create separate variable to distinguish from is_complete_word getter/setter methods

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
          if child.is_complete_word
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
