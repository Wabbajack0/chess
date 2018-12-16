class Board
  require_relative "piece"

  def initialize
    @squares = Array.new(8, nil)
    8.times { |i| @squares[i] = Array.new(8, nil) }
  end

  def print
    puts "  +―――+―――+―――+―――+―――+―――+―――+―――+"
    @squares.reverse.each_with_index do |row, index|
      temp = []
      row.each do |sqr|
        if sqr.nil?
          temp << "   "
        else
          if sqr.is_white
            temp << " " + sqr.img + "w"
          else
            temp << " " + sqr.img + "b"
          end
        end
      end
      puts "#{8 - index} │" + temp.join("│") + "│"
      puts "  +―――+―――+―――+―――+―――+―――+―――+―――+"
    end
    puts "    " + ("a".."h").to_a.join("   ")
  end

  def reset
    # Cleans the board
    @squares.map! do |row|
      row.map! { |sqr| sqr = nil }
    end
    # Adds white pieces
    @squares[0].map!.with_index do |sqr,index|
      sqr = reset_helper(index, true)
    end
    @squares[1].map! { |sqr| sqr = Pawn.new }
    # Adds black pieces
    @squares[7].map!.with_index do |sqr,index|
      sqr = reset_helper(index, false)
    end
    @squares[6].map! { |sqr| sqr = Pawn.new(false) }
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
