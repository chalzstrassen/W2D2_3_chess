class Pieces

  attr_reader :color

  def initialize(position, color)
      @board = Array.new(8) { Array.new(8) }
      @position = position
      @color = color
  end

  def valid_moves
    #
  end

end
