require_relative './skeleton/lib/00_tree_node.rb'

# W3D5 Class Project 2
class KnightPathFinder
  def initialize(pos)
    @root = PolyTreeNode.new(pos)
    @all_positions = KnightPathFinder.build_all_positions
    @all_positions[pos] = true
    build_all_moves
  end

  # determine if next_pos is an immediate viable move from cur_pos
  def valid_move?(cur_pos, next_pos)
    return false if @all_positions[next_pos] # no need to add already seen pos

    cur_col, cur_row = cur_pos
    next_col, next_row = next_pos
    condition1 = (next_col - cur_col).abs == 2 && (next_row - cur_row).abs == 1
    condition2 = (next_row - cur_row).abs == 2 && (next_col - cur_col).abs == 1
    condition1 || condition2
  end

  # build a hash contanining all positions on a chessboard
  def self.build_all_positions
    all_positions = {}
    (0...8).each do |col|
      (0...8).each do |row|
        all_positions[[col, row]] = false
      end
    end
    all_positions
  end

  # generate possible next moves of a given node as its children nodes
  def build_next_moves(current_node)
    cur_pos = current_node.value

    (0...8).each do |col|
      (0...8).each do |row|
        next_pos = [col, row]
        if valid_move?(cur_pos, next_pos)
          current_node.add_child(PolyTreeNode.new(next_pos))
          @all_positions[next_pos] = true
        end
      end
    end
  end

  def build_all_moves
    done = false
    pipeline = [@root]
    until done || pipeline.empty?
      done = true
      node = pipeline.shift
      build_next_moves(node)
      if @all_positions.values.any? { |val| val == false }
        done = false
        pipeline += node.children
      end
    end
  end

  def find_path(target_pos)
    target_node = @root.dfs(target_pos)
    path = []
    until target_node.nil?
      path.unshift(target_node.value)
      target_node = target_node.parent
    end
    path
  end
end

# Test
if __FILE__ == $PROGRAM_NAME
  kpf = KnightPathFinder.new([0, 0])
  p kpf.find_path([2, 1])
  p kpf.find_path([3, 3])
  p kpf.find_path([4, 4])
end
