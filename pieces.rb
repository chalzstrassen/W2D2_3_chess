class Pieces

  attr_reader :color

  def initialize(position, color)
      @board = Array.new(8) { Array.new(8) }
      @position = position
      @color = color
  end

  def moves
    #returns array of possible moves.
  end

  def valid_moves
    #
  end

end


class SlidingPieces < Pieces

  def moves(dirs)
    #array of positions piece can slide to
    #making sure no friendlies in its way
    #making sure it stops at enemy
  end

end


class Stepping < Pieces
  def moves(dirs)
    #array of positions piece can slide to
    #making sure position is not occupied with friendly
  end
end

class Bishop < SlidingPieces

  def move_dirs

  end

  def moves(move_dirs)
    super(move_dirs)
  end
end
require "byebug"
class Rook < SlidingPieces
    def move_dirs

    end

    def moves
      poss_dest = []
      row = @position.first
      col = @position.last
      8.times do |index|
        byebug
        poss_dest << [row, index] unless [row, index] == @position
        poss_dest << [index, col] unless [index, col] == @position
      end
      poss_dest
    end

end

class Queen < SlidingPieces
  def move_dirs

  end

  def moves(move_dirs)
    super(move_dirs)
  end


end
