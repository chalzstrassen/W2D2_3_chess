require_relative("board.rb")
require "byebug"
class Game
  COL = {
    "a" => 0,
    "b" => 1,
    "c" => 2,
    "d" => 3,
    "e" => 4,
    "f" => 5,
    "g" => 6,
    "h" => 7
  }
  ROW = {
    "1" => 0,
    "2" => 1,
    "3" => 2,
    "4" => 3,
    "5" => 4,
    "6" => 5,
    "7" => 6,
    "8" => 7
  }


  def initialize(player1, player2)
    @board = Board.new
    @player1 = player1
    @player2 = player2
  end

  def get_user_input(player)
    puts "#{player} Select the location of the piece you want to move."
    from = gets.chomp.downcase
    puts "You have selected #{from}"
    puts "Select the location you want to move to"
    to = gets.chomp.downcase
    puts "Moving to #{to}"

    from_pos = [ ROW[from[1]], COL[from[0]] ]
    to_pos = [ ROW[to[1]], COL[to[0]] ]

    [from_pos, to_pos]
  end


  def play
    moves = 0
    color = :w
    until @board.checkmate?(color)
      player = moves.even? ? @player1 : @player2
      color = player == @player1 ? :w : :b
      @board.render
      check_check?(color)
      move_positions = get_user_input(player)
      moving_piece = @board[move_positions[0]]
      destination = move_positions[1]
      if moving_piece.moves.include?(destination) &&
        !moving_piece.move_into_check?(destination)
        moving_piece.make_move(destination)
        moves += 1
      else
        puts "invalid move try again"
      end
    end
    @board.render
    puts "Checkmate!!"
  end

  def check_check?(color)
    if @board.in_check?(color)
      checked_color = color == :w ? "White" : "Black"
      puts "#{checked_color} you are in check!!"
    end
    nil
  end

end

class Player



end
