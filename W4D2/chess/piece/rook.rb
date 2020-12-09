require_relative "piece.rb"
require_relative "Slideable"

class Rook < Piece
  include Slideable

  def symbol 
    :R
  end


end


