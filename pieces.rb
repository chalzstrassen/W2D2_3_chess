
class Pieces

  attr_reader :color
  attr_accessor :position

  def initialize(board, position = [], color = nil)
      @board = board
      @position = position
      @color = color
  end



  def valid_moves
    #
  end

end
