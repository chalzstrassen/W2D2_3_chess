require "byebug"
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
      capture_piece(pos) unless @board[pos].nil?
      self.position = pos
      @board[pos] = self
    end
  end

  def capture_piece(pos)
    captured_piece = @board[pos]
    captured_piece.position = nil
  end



  def move_into_check?(pos)
    dup_board = @board.deep_dup
    dup_piece = self.class.new(dup_board, self.position, self.color)
    dup_piece.make_move(pos)
    if dup_board.in_check?(self.color)
      return true
    end
    false
  end

end
