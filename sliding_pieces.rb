require_relative("pieces.rb")

class SlidingPieces < Pieces

  def rook_moves
    row = @position.first
    col = @position.last
    rook_vertical(row, col) + rook_horizontal(row, col)
  end

  def bishop_moves
    row = @position.first
    col = @position.last
    left_up = left_up(row, col)
    right_up = right_up(row, col)
    left_down = left_down(row, col)
    right_down = right_down(row, col)
    left_up + right_up + left_down + right_down
  end

  private
  def rook_vertical(row, col)
    vertical_pos = []
    if row < 6
      (row+1).upto(7) do |row_below|
        pos = [row_below, col]
        break if !@board[pos].nil? && @board[pos].color == self.color
        vertical_pos << pos
        break if !@board[pos].nil? && @board[pos].color != self.color
      end
    end
    if row > 0
      (row-1).downto(0) do |row_above|
        pos = [row_above, col]
        break if !@board[pos].nil? && @board[pos].color == self.color
        vertical_pos << pos
        break if !@board[pos].nil? && @board[pos].color != self.color
      end
    end

    vertical_pos
  end

  def rook_horizontal(row, col)
    horizontal_pos = []
    if col.between?(0,7)
      (col+ 1).upto(7) do |right_col|
        pos = [row, right_col]
        break if !@board[pos].nil? && @board[pos].color == self.color
        horizontal_pos << pos
        break if !@board[pos].nil? && @board[pos].color != self.color
      end

      (col-1).downto(0) do |left_col|
        pos = [row, left_col]
        break if !@board[pos].nil? && @board[pos].color == self.color
        horizontal_pos << pos
        break if !@board[pos].nil? && @board[pos].color != self.color
      end
    end
    horizontal_pos
  end

  def left_up(row, col)
    return [] if row == 0
    poss_dest = []
    (row-1).downto(0).each do |r_index|
      col -= 1
      pos = [r_index, col]
      break if !@board[pos].nil? && @board[pos].color == self.color
      poss_dest << pos if col >= 0
      break if !@board[pos].nil? && @board[pos].color != self.color
    end
    poss_dest
  end

  def left_down(row, col)
    return [] if row == 7
    poss_dest =[]
    (row+1).upto(7).each do |r_index|
      col -= 1
      pos = [r_index, col]
      break if !@board[pos].nil? && @board[pos].color == self.color
      poss_dest << [r_index, col] if col >= 0
      break if !@board[pos].nil? && @board[pos].color != self.color
    end
    poss_dest
  end

  def right_up(row, col)
    return [] if row == 0
    poss_dest = []
    (row-1).downto(0).each do |r_index|
      col += 1
      pos = [r_index, col]
      break if !@board[pos].nil? && @board[pos].color == self.color
      poss_dest << [r_index, col] if col <= 7
      break if !@board[pos].nil? && @board[pos].color != self.color
    end
    poss_dest
  end

  def right_down(row, col)
    return [] if row == 7
    poss_dest = []
    (row+1).upto(7).each do |r_index|
      col += 1
      pos = [r_index, col]
      break if !@board[pos].nil? && @board[pos].color == self.color
      poss_dest << [r_index, col] if col <= 7
      break if !@board[pos].nil? && @board[pos].color != self.color
    end
    poss_dest
  end


end

class Bishop < SlidingPieces

  def moves
    bishop_moves
  end


end

class Rook < SlidingPieces
    def moves
      rook_moves
    end



end

class Queen < SlidingPieces
  def move_dirs

  end

  def moves
    bishop_moves + rook_moves
  end
end
