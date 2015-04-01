
class Pieces

  attr_reader :color
  attr_accessor :position

  def initialize(board, position = [], color = nil)
      @board = board
      @position = position
      @color = color
  end



  def make_move(pos)
    if self.moves.include?(pos)
      @board[self.position] = nil
      self.position = pos
      @board[pos] = self
    end
  end

end
