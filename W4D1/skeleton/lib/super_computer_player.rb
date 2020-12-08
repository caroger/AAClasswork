require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    node = TicTacToeNode.new(game.board, mark)

    possible_moves = node.children

    node = possible_moves.find { |node| node.winning_node?(mark) }
    return node.prev_move_pos if node

    node = possible_moves.find { |node| !node.losing_node?(mark) }
    return node.prev_move_pos if node

    raise "computer is going to lose T.T"

  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
