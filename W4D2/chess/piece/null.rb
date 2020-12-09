
require_relative 'piece.rb'
require 'singleton'

class NullPiece < Piece
  include Singleton

  attr_reader :symbol

  def initialize
    @symbol = ' '
    @color = :none
    super
  end

  def empty? 
    true 
  end

end