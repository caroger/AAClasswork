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

  def []=(pos,val) 
    row, col = pos 
    @grid[row][col] = val 
  end

  def add_piece(pos, piece)
    self[pos] = piece 
  end


  def move_piece(start_pos, end_pos)
    end_row, end_col = end_pos 
    raise "Invalid move" if !self[end_pos].nil?
    self[end_pos] = self[start_pos]
    self[start_pos] = nil 
  end

  def make_new_board # return 2d array
    @grid = Array.new(8) {Array.new(8, p_null)}
  end
  
end