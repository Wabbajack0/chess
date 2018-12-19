class Piece
  attr_accessor :is_white, :img

  def initialize(is_white = true)
    @is_white = is_white
    @img = ""
  end

end

class Pawn < Piece
  def initialize(is_white = true)
    super
    @is_white ? @img = "♟" : @img = "♙"
  end

  def correct_move?(x1, y1, x2, y2)
    if @is_white
      return true if (y2 - y1) === 1
      return true if (y2 - y1) === 2 && y1 === 1 && x1 === x2
    else
      return true if (y2 - y1) === -1
      return true if (y2 - y1) === -2 && y1 === 6 && x1 === x2
    end
    return false
  end
end

class King < Piece
  def initialize(is_white = true)
    super
    @is_white ? @img = "♚" : @img = "♔"
  end

  def correct_move?(x1, y1, x2, y2)
    return true if (x1 - x2).abs <= 1 && (y1 - y2).abs <= 1
    return false
  end
end

class Queen < Piece
  def initialize(is_white = true)
    super
    @is_white ? @img = "♛" : @img = "♕"
  end

  def correct_move?(x1, y1, x2, y2)
    return true if x1 === x2 || y1 === y2
    return true if (x2 - x1).abs === (y2 - y1).abs
    return false
  end
end

class Bishop < Piece
  def initialize(is_white = true)
    super
    @is_white ? @img = "♝" : @img = "♗"
  end

  def correct_move?(x1, y1, x2, y2)
    return true if (x2 - x1).abs === (y2 - y1).abs
    return false
  end
end

class Knight < Piece
  def initialize(is_white = true)
    super
    @is_white ? @img = "♞" : @img = "♘"
  end

  def correct_move?(x1, y1, x2, y2)
    return true if (x1 - x2).abs + (y1 - y2).abs === 3 && (x1 - x2) * (y1 - y2) != 0
    return false
  end
end

class Rook < Piece
  def initialize(is_white = true)
    super
    @is_white ? @img = "♜" : @img = "♖"
  end

  def correct_move?(x1, y1, x2, y2)
    return true if x1 === x2 || y1 === y2
    return false
  end
end
