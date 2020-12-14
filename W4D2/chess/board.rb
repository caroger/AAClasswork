require_relative "./piece/rook.rb"
require_relative './piece/null.rb'
# require_relative './piece/piece.rb'

class Board

  attr_accessor :grid, :p_null

  def initialize
    @grid = []
    @p_null = NullPiece.instance
    make_new_board
  end

  def [](pos)
    row, col = pos 
    @grid[row][col]
  end

  def []=(pos, piece) 
    row, col = pos 
    @grid[row][col] = piece 
  end

  def add_piece(pos, piece)
    self[pos] = piece 
  end


  def move_piece(start_pos, end_pos)
    
    end_row, end_col = end_pos 
    if self[start_pos].moves.include?(end_pos)
      self[end_pos] = self[start_pos] 
      self[start_pos] = p_null
    else   
      raise "Invalid move" if !self[end_pos].empty?
    end

  end

  def make_new_board # return 2d array
    @grid = Array.new(8) {Array.new(8, p_null)}
  end
  
  def valid_pos?(pos)
    x,y = pos 
    x.between?(0,7) && y.between?(0,7)
  end

  def display
    @grid.map {|row| row.map {|p| p.to_s }}
  end

end

b = Board.new
r = Rook.new("white", b, [0,0])
p b.display 
p r.moves 
r2 = Rook.new("black", b, [0,5])
p r.moves 