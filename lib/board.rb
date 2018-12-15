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
          temp << " " + sqr.img + " "
        end
      end
      puts "#{8 - index} │" + temp.join("│") + "│"
      puts "  +―――+―――+―――+―――+―――+―――+―――+―――+"
    end
    puts "    " + ("a".."h").to_a.join("   ")
  end

end
