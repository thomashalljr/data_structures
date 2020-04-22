require_relative "../modules/doubly_linked_list.rb"

module Graph

  class Node
    attr_reader :id, :adjacent

    def initialize(id)
      @id       = id
      @adjacent = DoublyLinkedList::DoublyLinkedList.new
    end
  end

  class Graph
    attr_reader :node_map

    def initialize
      @node_map = {}
    end

    def get_node(id)
      return node_map[id]
    end

    def add_node(id)
      node_map[id] = Node.new(id)
    end

    def add_edge(source, destination)
      unless node_map[source]
        node_map[source] = Node.new(source)
      end

      unless node_map[destination]
        node_map[destination] = Node.new(destination)
      end

      node_map[source].adjacent.append(destination)
    end

    def has_path_dfs_helper(source, destination)
      visited = []
      source = get_node(source)
      destination = get_node(destination)
      return has_path_dfs(source, destination, visited)
    end

    def has_path_dfs(source, destination, visited)
      if source.eql? destination
        return true
      end

      if visited.include? source.id
        return false
      end

      visited.push(source.id)

      source.adjacent.each do |child|
        child = get_node(child.data)

        if has_path_dfs(child, destination, visited)
          return true
        end
      end

      return false
    end

    def has_path_bfs_helper(source, destination)
      source = get_node(source)
      destination = get_node(destination)
      return has_path_bfs(source, destination)
    end

    def has_path_bfs(source, destination)
      visited = []
      next_to_visit = DoublyLinkedList::DoublyLinkedList.new(source.id)

      while !next_to_visit.empty?
        node = next_to_visit.remove
        node = get_node(node.data)

        if node.eql? destination
          return true
        end

        if visited.include? node.id
          next
        end

        visited.push(node.id)

        node.adjacent.each do |child|
          next_to_visit.append(child.data)
        end
      end

      return false
    end
  end

end
