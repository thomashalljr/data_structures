require_relative "../modules/graph.rb"

graph = Graph::Graph.new
graph.add_node(1)
graph.add_edge(1, 2)
graph.add_edge(1, 3)
graph.add_edge(1, 4)
graph.add_edge(1, 6)
graph.add_edge(2, 3)
graph.add_edge(3, 6)
graph.add_edge(4, 6)
graph.add_edge(5, 6)
graph.add_edge(6, 8)
graph.add_edge(7, 8)

puts ""
puts "has path BFS from 1 to 8: #{graph.has_path_bfs_helper(1, 8)}"
puts "has path DFS from 1 to 8: #{graph.has_path_dfs_helper(1, 8)}"
puts ""

puts "has path BFS from 1 to 7: #{graph.has_path_bfs_helper(1, 7)}"
puts "has path DFS from 1 to 7: #{graph.has_path_dfs_helper(1, 7)}"
puts ""

puts "has path BFS from 7 to 8: #{graph.has_path_bfs_helper(7, 8)}"
puts "has path DFS from 7 to 8: #{graph.has_path_dfs_helper(7, 8)}"
puts ""

puts "has path BFS from 1 to 6: #{graph.has_path_bfs_helper(1, 6)}"
puts "has path DFS from 1 to 6: #{graph.has_path_dfs_helper(1, 6)}"
puts ""
