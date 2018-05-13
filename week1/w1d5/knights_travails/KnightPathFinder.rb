require_relative "00_tree_node"

class KnightPathFinder

  attr_reader :tree

  BOARD_SIZE = 8
  MOVES = [
          [-2,1],[-2,-1],
          [2,1],[2,-1],
          [-1,2],[1,2],
          [-1,-2],[1,-2]
          ]

  def initialize(start_pos)
    @start_pos = start_pos
    @tree = nil
    @visited_positions = [@start_pos]
    self.build_move_tree
  end

  def build_move_tree
    @tree = PolyTreeNode.new(@start_pos)
    curr_nodes = [@tree]
    while @visited_positions.length < BOARD_SIZE ** 2
      possible_moves = KnightPathFinder.valid_moves(curr_nodes.first.value)
      possible_moves.reject! {|move| @visited_positions.include?(move)}
      possible_moves.each do |pos|
        new_child = PolyTreeNode.new(pos)
        curr_nodes.first.add_child(new_child)
        curr_nodes << new_child
        @visited_positions << pos
      end
      curr_nodes.shift
    end
  end

  def self.valid_moves(pos)
    valid_moves = []
    MOVES.each do |move|
      moved_pos = [pos[0] + move[0], pos[1] + move[1]]
      if moved_pos.all? {|pos| pos.between?(0,(BOARD_SIZE - 1))}
        valid_moves << moved_pos
      end
    end
    valid_moves
  end

  def find_path(pos)
    path = []
    found_node = @tree.dfs(pos)
    until found_node == nil
      path.unshift(found_node.value)
      found_node = found_node.parent
    end
    path
  end


end


if __FILE__ == $0

  new_knight = KnightPathFinder.new([0,0])
p new_knight.find_path([6,5])
end
