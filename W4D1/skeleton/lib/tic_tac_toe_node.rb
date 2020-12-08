require_relative 'tic_tac_toe'

class TicTacToeNode

  attr_accessor :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    if @board.over?
      return @board.won? && @board.winner != evaluator
    end

    if evaluator == @next_mover_mark
      children.all? { |child| child.losing_node?(evaluator) }
    else
      children.any? { |child| child.losing_node?(evaluator) }
    end
  end

  def winning_node?(evaluator)
    if @board.over?
      return @board.winner == evaluator
    end

    if evaluator == @next_mover_mark
      children.any? { |child| child.winning_node?(evaluator) }
    else
      children.all? { |child| child.winning_node?(evaluator) }
    end
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def next_mark
    @next_mover_mark == :x ? :o : :x
  end

  def children
    children_arr = []
    (0..2).each do |row|
      (0..2).each do |col|
        pos = [row, col]
        if @board.empty?(pos)
          new_board = @board.dup
          new_board[pos] = @next_mover_mark
          new_mark = next_mark
          child = TicTacToeNode.new(new_board, new_mark, pos)
          children_arr << child
        end
      end
    end
    children_arr
  end

end
