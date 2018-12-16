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
    @squares.map! do |row|
      row.map! { |sqr| sqr = nil }
    end

    @squares[0].map!.with_index do |sqr,index|
      case index
      when 0, 7
        sqr = Rook.new
      when 1, 6
        sqr = Knight.new
      when 2, 5
        sqr = Bishop.new
      when 3
        sqr = Queen.new
      when 4
        sqr = King.new
      end
    end
    @squares[1].map! { |sqr| sqr = Pawn.new }
    @squares[6].map! { |sqr| sqr = Pawn.new(false) }
    @squares[7].map!.with_index do |sqr,index|
      case index
      when 0, 7
        sqr = Rook.new(false)
      when 1, 6
        sqr = Knight.new(false)
      when 2, 5
        sqr = Bishop.new(false)
      when 3
        sqr = Queen.new(false)
      when 4
        sqr = King.new(false)
      end
    end
  end

end
