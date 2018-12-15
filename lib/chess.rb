class Chess
  require_relative "board"

  def initialize
    @board = Board.new
    @board.reset
  end

  def print_board
    @board.print
  end

end
