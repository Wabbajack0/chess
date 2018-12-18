class Chess
  require_relative "piece"

  def initialize
    @board = Array.new(8, nil)
    8.times { |i| @board[i] = Array.new(8, nil) }
  end

  def print
    puts "  +---+---+---+---+---+---+---+---+"
    @board.each_with_index do |row, index|
      temp = []
      row.each do |sqr|
        if sqr.nil?
          temp << "   "
        else
          temp << " " + sqr.img
        end
      end
      puts "#{8 - index} |" + temp.join("|") + "|"
      puts "  +---+---+---+---+---+---+---+---+"
    end
    puts "    " + ("a".."h").to_a.join("   ")
  end

  def reset
    # Cleans the board
    @board.map! do |row|
      row.map! { |sqr| sqr = nil }
    end
    # Adds white pieces
    @board[0].map!.with_index do |sqr,index|
      sqr = reset_helper(index, true)
    end
    @board[1].map! { |sqr| sqr = Pawn.new(true) }
    # Adds black pieces
    @board[7].map!.with_index do |sqr,index|
      sqr = reset_helper(index, false)
    end
    @board[6].map! { |sqr| sqr = Pawn.new(false) }
  end

  private

  # Takes the index of the reset function and the color of
  # the piece and returns the piece to place in that index
  def reset_helper(index, is_white)
    case index
    when 0, 7
      Rook.new(is_white)
    when 1, 6
      Knight.new(is_white)
    when 2, 5
      Bishop.new(is_white)
    when 3
      Queen.new(is_white)
    when 4
      King.new(is_white)
    end
  end
end
