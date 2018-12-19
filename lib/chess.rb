class Chess
  require_relative "piece"

  def initialize
    @board = Array.new(8, nil)
    @board.map! { |row| row = Array.new(8, nil) }
  end

  def move(x1, y1, x2, y2)
    return false if !move_allowed?(x1, y1, x2, y2)
    @board[y2][x2], @board[y1][x1] = @board[y1][x1], nil
    return true
  end

  def print
    puts "  +---+---+---+---+---+---+---+---+"
    @board.reverse.each.with_index do |row, i|
      temp = row.map { |sqr| sqr.nil? ? "   " : " " + sqr.img }
      puts "#{8 - i} |" + temp.join("|") + "|"
      puts "  +---+---+---+---+---+---+---+---+"
    end
    puts "    " + ("a".."h").to_a.join("   ")
  end

  def reset
    # Cleans the board
    @board.map! { |row| row.map! { |sqr| sqr = nil } }
    # Adds white pieces
    @board[0].map!.with_index { |sqr,index| sqr = reset_helper(index, true) }
    @board[1].map! { |sqr| sqr = Pawn.new(true) }
    # Adds black pieces
    @board[7].map!.with_index { |sqr,index| sqr = reset_helper(index, false) }
    @board[6].map! { |sqr| sqr = Pawn.new(false) }
  end

  private

  # Checks if there is a reason that makes the move illegal
  def move_allowed?(x1, y1, x2, y2)
    return false if x2 < 0 || y2 < 0 || x2 > 7 || y2 > 7  #Outside of the board
    return false if x1 === x2 && y1 === y2 #Can't stay still
    piece = @board[y1][x1]
    #Must select a piece
    return false if piece.nil?
    #Can't eat a piece of the same color
    return false if !@board[y2][x2].nil? && piece.is_white === @board[y2][x2].is_white
    #The piece moves accordingly to it's type
    return false if !piece.correct_move?(x1, y1, x2, y2)
    #There isn't a piece in the path (knight excluded)
    return false if !piece.instance_of?(Knight) && !free_path?(x1, y1, x2, y2)
    #A pawn can't eat a piece in front of itself
    return false if piece.instance_of?(Pawn) && x1 === x2 && !@board[y2][x2].nil?
    #A pawn can't move diagonally if it doesn't eat
    return false if piece.instance_of?(Pawn) && x1 != x2 && @board[y2][x2].nil?
    return true
  end

  # Checks if there is a piece from point a to point b
  # excluding the final point
  def free_path?(x1, y1, x2, y2)
    case
    when x1 === x2    # The piece moves vertically
      (y1+1...y2).each { |i| return false if !@board[i][x1].nil? } if y1 < y2
      (y2+1...y1).each { |i| return false if !@board[i][x1].nil? } if y1 < y2

    when y2 === y1    # The piece moves horizontally
      (x1+1...x2).each { |i| return false if !@board[y1][i].nil? } if x1 < x2
      (x2+1...x1).each { |i| return false if !@board[y1][i].nil? } if x1 > x2

    else    # The piece moves diagonally
      if y1 < y2
        (y1+1...y2).each.with_index { |i,j| return false if !@board[i][x1+j+1].nil? } if x1 < x2
        (y1+1...y2).each.with_index { |i,j| return false if !@board[i][x1-j-1].nil? } if x1 > x2
      else
        (y2+1...y1).each.with_index { |i,j| return false if !@board[i][x2-1-j].nil? } if x1 < x2
        (y2+1...y1).each.with_index { |i,j| return false if !@board[i][x2+j+1].nil? } if x1 > x2
      end
    end

    return true
  end

  # Takes the index of the reset function and the color of
  # the piece and returns the piece to place at that index
  def reset_helper(index, is_white)
    case index
    when 0, 7 then Rook.new(is_white)
    when 1, 6 then Knight.new(is_white)
    when 2, 5 then Bishop.new(is_white)
    when 3 then Queen.new(is_white)
    when 4 then King.new(is_white)
    end
  end
end
