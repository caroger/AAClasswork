require 'byebug'
module Slideable

  # CURRENT POS = [0,0]
  HORIZONTAL_DIRS = [[0,-1], [0,1]]
  VERTICAL_DIRS = [[-1,0], [1,0]]
  DIAGONAL_DIRS = [[-1,-1], [-1,1], [1,-1], [1,1]]

  def horizontal_dirs 
    HORIZONTAL_DIRS
  end

  def vertical_dirs 
    VERTICAL_DIRS
  end

  def diagonal_dirs 
    DIAGONAL_DIRS
  end

  def moves 
    legal_moves = [] 
    move_dirs.each do |dir|
      legal_moves += grow_unblocked_moves_in_dir(dir[0], dir[1])
    end 
    legal_moves
  end

  
  private
  def move_dirs

  end

  def grow_unblocked_moves_in_dir(dx, dy) # [0, -1]
    cur_x, cur_y  = pos #[3,3]
    unblocked_moves = [] # [3,2], [3,1], [3,0] 
    loop do 
      cur_x = cur_x + dx #[3]
      cur_y = cur_y + dy #[0]
      next_pos = [cur_x, cur_y] # [3,1] 
      # debugger 
      break if out_of_bound?(next_pos) 
      break if !board[next_pos].empty? 

      unblocked_moves << next_pos #[3,0]
    end
    unblocked_moves  
  end
end

