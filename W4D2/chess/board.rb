
class Board
  def initialize()
    @board = Board.make_new_board
  end

  def [](pos)
    row, col = pos 
    @board[row][col]
  end

  def []=(pos,val)
    row, col = pos 
    @board[row][col] = val 
  end


  def move_piece(start_pos, end_pos)
    end_row, end_col = end_pos 
    raise "Invalid move" if !self[end_pos].nil?
    self[end_pos] = self[start_pos]
    self[start_pos] = nil 
  end

  def self.make_new_board # return 2d array
    board = Array.new(8) {Array.new(8, nil)}
    board[0][0] = "Rook"
    board[0][7] = "Rook"
    board[7][0] = "Rook"
    board[7][7] = "Rook"
    board[0][1] = "Knight"
    board[0][6] = "Knight"
    board[7][1] = "Knight"
    board[7][6] = "Knight"
    board 
  end
  
end