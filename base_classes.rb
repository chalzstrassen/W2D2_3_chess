
class Pieces

  attr_reader :color

  def initialize(board, position, color)
      @board = board
      @position = position
      @color = color
  end

  def valid_moves
    #
  end

end

require_relative("sliding_pieces.rb")
require_relative("stepping_pieces.rb")

class Board
  def initialize
    @grid = Array.new(8) { Array.new(8) }
    generate_pieces
    #place_pieces
  end

  def [](pos)
    row, col = pos.first, pos.last
    @grid[row][col]
  end

  def []=(pos, piece)
    row, col = pos.first, pos.last
    @grid[row][col] = piece
  end

  private

  def generate_pieces
    make_queens
    # make_kings
    # make_bishops
    # make_knights
    # make_rooks
    # make_pawns
  end

  def make_queens
    black = Queen.new(self, [0, 3], :b)
    self[[0, 3]] = black
    white = Queen.new(self, [7, 3], :w)
    self[[7, 3]] = white

  end
end
