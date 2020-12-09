class Piece

  attr_accessor :color, :board, :pos 

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
    board.add_piece(pos, self)
  end

  def symbol 
    :S 
  end

  def to_s
    " #{symbol} "
  end

  def empty?
    false 
  end

  def valid_moves

  end

  def pos=(val)

  end
  
  private
  def move_into_check?(end_pos)
  end

end


