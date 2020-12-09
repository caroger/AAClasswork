
module Slideable

  # CURRENT POS = [0,0]
  HORIZONTAL_DIRS = [[0,-1], [0,1]]
  VERTICAL_DIRS = [[-1,0], [1,0]]
  DIAGONAL_DIRS = [[-1,-1], [-1,1], [1,-1], [1,1]]

  def horizontal_dirs 
    HORIZONTAL_DIRS
  end

  def diagonal_dirs 
    DIAGONAL_DIRS
  end

  def moves 
    moves = [] # [1,3]
  end

  private
  def grow_unblocked_moves_in_dir(dx, dy) # pos = [0,2]
    cur_x, cur_y  = pos 
    unblocked_moves = [] # [1,3], [2,4]
    loop do 
      cur_x = cur_x + dx 
      cur_y = cur_y + dy 
      next_pos = [cur_x, cur_y] #[0 + 1, 2 + 1] =>  
      break if @board[next_pos] != nil || out_of_bound?(next_pos)
      if @board[next_pos] == nil
        unblocked_moves << next_pos #[1,3]
      end
    end
    
  end
end