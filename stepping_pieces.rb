require_relative("pieces.rb")

class SteppingPieces < Pieces
  def moves(deltas)
    row = @position.first
    col = @position.last
    poss_dest = []
    deltas.each do |dx, dy|
      if (row + dx).between?(0, 7) && (col + dy).between?(0, 7)
        poss_dest << [row + dx, col + dy]
      end
    end

    poss_dest
  end
end

class Knight < SteppingPieces
  DELTAS = [
    [-2, -1],
    [-2,  1],
    [-1, -2],
    [-1,  2],
    [ 1, -2],
    [ 1,  2],
    [ 2, -1],
    [ 2,  1]
  ]

  def moves(deltas = DELTAS)
    super
  end
end

class King < SteppingPieces
  DELTAS = [
    [ 1,  0],
    [ 1,  1],
    [ 1, -1],
    [ 0,  1],
    [ 0, -1],
    [-1,  0],
    [-1,  1],
    [-1, -1],
  ]
  def moves(delta = DELTAS)
    super
  end
end

class Pawn < SteppingPieces
  DELTAS = [
    [ 1,  0],
    [ 1,  1],
    [ 1, -1],
    [-1,  0],
    [-1,  1],
    [-1, -1],
  ]

  def moves
    delta = DELTAS
    if color == :w
      delta = DELTAS.drop(3)
    else
      delta = DELTAS.take(3)
    end

    super(delta)
  end
end
