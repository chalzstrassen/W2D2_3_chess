require_relative("pieces.rb")
require "byebug"

class SteppingPieces < Pieces
  def moves(deltas)
    row = @position.first
    col = @position.last
    poss_dest = []
    deltas.each do |dx, dy|
      if (row + dx).between?(0, 7) && (col + dy).between?(0, 7)
        pos = [row + dx, col + dy]
        poss_dest << pos if pos_valid?(pos)
      end
    end

    poss_dest
  end

  def pos_valid?(pos)
    return true if @board[pos].nil?
    return true if self.color != @board[pos].color
    false

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

  FIRST_DELTAS = [
    [1, 0],
    [2, 0],
    [-1, 0],
    [-2, 0]
  ]

  def initialize(board, pos, color, first_move = true)
    super(board, pos, color)
    @first_move = first_move
  end


  def moves
    delta = @first_move ? FIRST_DELTAS : DELTAS
    mid = delta.count / 2
    if color == :w
      delta = delta.drop(mid)
    else
      delta = delta.take(mid)
    end

    super(delta)
  end
end
