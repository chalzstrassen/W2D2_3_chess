require_relative("pieces.rb")

class SlidingPieces < Pieces

  def rook_moves
    poss_dest = []
    row = @position.first
    col = @position.last
    8.times do |index|

      poss_dest << [row, index] unless [row, index] == @position
      poss_dest << [index, col] unless [index, col] == @position
    end
    poss_dest
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

  def left_up(row, col)
    return [] if row == 0
    poss_dest = []
    (row-1).downto(0).each do |r_index|
      col -= 1
      poss_dest <<  [r_index, col] if col >= 0
    end
    poss_dest
  end

  def left_down(row, col)
    return [] if row == 7
    poss_dest =[]
    (row+1).upto(7).each do |r_index|
      col -= 1
      poss_dest << [r_index, col] if col >= 0
    end
    poss_dest
  end

  def right_up(row, col)
    return [] if row == 0
    poss_dest = []
    (row-1).downto(0).each do |r_index|
      col += 1
      poss_dest << [r_index, col] if col <= 7
    end
    poss_dest
  end

  def right_down(row, col)
    return [] if row == 7
    poss_dest = []
    (row+1).upto(7).each do |r_index|
      col += 1
      poss_dest << [r_index, col] if col <= 7
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
