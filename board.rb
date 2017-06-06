require_relative 'piece'
require_relative 'nullpiece'
require_relative 'rook'
require_relative 'knight'
require_relative 'bishop'
require_relative 'queen'
require_relative 'king'
require_relative 'pawn'

class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(8) {Array.new(8)}
    @null_piece = NullPiece.send :new
    make_starting_grid

  end
  ROW = %w(Rook Knight Bishop Queen King Bishop Knight Rook)

  def make_starting_grid
    (0..7).each do |row|
      (0..7).each do |col|
        if row == 1
          @grid[row][col] = Pawn.new(:black,[row,col], self)
        elsif row == 6
          @grid[row][col] = Pawn.new(:white,[row,col], self)
        elsif row == 0
          @grid[row][col] = eval(ROW[col]).new(:black,[row,col], self)
        elsif row == 7
          @grid[row][col] = eval(ROW[col]).new(:white,[row,col], self)
        else
          @grid[row][col] = @null_piece
        end
      end
    end
  end

  def [] pos
    x, y = pos
    @grid[x][y]
  end

  def []= pos, piece
    x, y = pos
    @grid[x][y] = piece
  end

  def dup
  end

  def move_piece(from_pos, to_pos)
    raise Exception.new if self[from_pos].nil?
    raise Exception.new unless self[to_pos].nil?
    piece = self[from_pos]
    self[from_pos], self[to_pos] = nil, piece
  rescue Exception
    puts "Invalid move."
  end

  def in_bounds?(pos)
    pos.all? { |coord| (0..7).include?(coord) }
  end

  # def move_piece!(from_pos, to_pos)
  # end

  def checkmate?
  end

  def find_king(color)
  end
end
