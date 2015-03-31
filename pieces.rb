class Pieces

  attr_reader :color

  def initialize(board, position, color)
      @board = board
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
      #Deltat that the bishop can take in an array
  end

  def moves(move_dirs)
    super(move_dirs)
  end
end

class Rook < SlidingPieces
    def move_dirs

    end

    def moves(move_dirs)
      super(move_dirs)
    end

end

class Queen < SlidingPieces

end
