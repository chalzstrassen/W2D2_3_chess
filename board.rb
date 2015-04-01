require_relative("pieces.rb")
require_relative("sliding_pieces.rb")
require_relative("stepping_pieces.rb")
require "colorize"

require 'byebug'
class Board
  BACK_ROW = [
              Rook,
              Knight,
              Bishop,
              Queen,
              King,
              Bishop,
              Knight,
              Rook
              ]

  UNICODE = {
    :wking     =>   "\u2654 ",
    :wqueen    =>   "\u2655 ",
    :wrook     =>   "\u2656 ",
    :wbishop   =>   "\u2657 ",
    :wknight   =>   "\u2658 ",
    :wpawn     =>   "\u2659 ",
    :bking     =>   "\u265A ",
    :bqueen    =>   "\u265B ",
    :brook     =>   "\u265C ",
    :bbishop   =>   "\u265D ",
    :bknight   =>   "\u265E ",
    :bpawn     =>   "\u265F "
  }

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    place_pieces
    render
  end

  def [](pos)
    row, col = pos.first, pos.last
    @grid[row][col]
  end

  def []=(pos, piece)
    row, col = pos.first, pos.last
    @grid[row][col] = piece
  end

  def render
    @grid.each_with_index do |row, r_idx|
      line = ""
      row.each_with_index do |space, s_idx|
        if (r_idx.even? && s_idx.even?) ||
          (r_idx.odd? && s_idx.odd?)
          line += display_tile(r_idx, s_idx).colorize(:black).on_light_black
        else
          line += display_tile(r_idx, s_idx).colorize(:black).on_light_red
        end
      end
      puts line
    end

  end

  def display_tile(row, col)
    return "  " if @grid[row][col].nil?

    piece = @grid[row][col]

    if piece.is_a?(King)
      return piece.color == :b ? UNICODE[:bking] : UNICODE[:wking]
    elsif piece.is_a?(Queen)
      return piece.color == :b ? UNICODE[:bqueen] : UNICODE[:wqueen]
    elsif piece.is_a?(Rook)
      return piece.color == :b ? UNICODE[:brook] : UNICODE[:wrook]
    elsif piece.is_a?(Knight)
      return piece.color == :b ? UNICODE[:bknight] : UNICODE[:wknight]
    elsif piece.is_a?(Bishop)
      return piece.color == :b ? UNICODE[:bbishop] : UNICODE[:wbishop]
    else
      return piece.color == :b ? UNICODE[:bpawn] : UNICODE[:wpawn]
    end

  end

  private

  def place_pieces
    BACK_ROW.each_with_index do |piece, col|
      pos = [0 , col]
      self[pos] = piece.new(self, pos, :b)
      pos = [7, col]
      self[pos] = piece.new(self, pos, :w)
    end

    8.times do |col|
      pos = [1, col]
      self[pos] = Pawn.new(self, pos, :b)
      pos = [6, col]
      self[pos] = Pawn.new(self, pos, :w)
    end

  end
  # def generate_pieces
  #   make_queens
  #   make_kings
  #   # make_bishops
  #   # make_knights
  #   # make_rooks
  #   # make_pawns
  # end
  #
  # def make_queens
  #   black = Queen.new(self, [0, 3], :b)
  #   self[[0, 3]] = black
  #   white = Queen.new(self, [7, 3], :w)
  #   self[[7, 3]] = white
  # end
  #
  # def make_kings
  #   black = King.new(self, [0, 4], :b)
  #   self[[0,4]] = black
  #   white = King.new(self, [7, 4], :w)
  #   self[[7,4]] = white
  # end

end
