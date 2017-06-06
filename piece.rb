require_relative 'stepable'
require_relative 'slideable'
require 'colorize'

class Piece

  attr_reader :display_symbol

  def initialize(color, starting_pos, board)
    @color = color
    @symbol = symbol
    @current_pos = starting_pos
    @board = board
  end

  def to_s
    SYMBOLS[@symbol].colorize( @color )#in specific piece
  end

  def empty?
    false
  end

  SYMBOLS = {Rook: " ♖ ",
    Knight: " ♘ ",
    Bishop: " ♗ ",
    Queen: " ♕ ",
    King: " ♔ ",
    Pawn: " ♙ "
  }

  def symbol
    self.class.to_s.to_sym
  end

  def valid_moves
    on_board = self.moves.select do |move|
      move.all? { |coord| (0..7).include? coord }
    end
    board[move].empty?
  end

  private

  def move_into_check(to_pos)
  end
end
