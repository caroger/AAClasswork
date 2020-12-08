class Board
  def initialize()
    @board = Array.new(8) {Array.new(8, nil)}
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
  
end