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
    return false if (x2 - x1).abs > 1
    return false if (x2 - x1).abs === 1 && (y2 - y1).abs === 2
    return false if (y2 - y1).abs > 2
    if @is_white
      return false if y2 <= y1
      if y2 - y1 === 2
        return true if y1 === 1
        return false
      end
    else
      return false if y2 >= y1
      if y2 - y1 === -2
        return true if y1 === 6
        return false
      end
    end
    return true
  end
end

class King < Piece
  def initialize(is_white = true)
    super
    @is_white ? @img = "♚" : @img = "♔"
  end

  def correct_move?(x1, y1, x2, y2)
    return false if (x2 - x1).abs > 1
    return false if (y2 - y1).abs > 1
    return true
  end
end

class Queen < Piece
  def initialize(is_white = true)
    super
    @is_white ? @img = "♛" : @img = "♕"
  end

  def correct_move?(x1, y1, x2, y2)

  end
end

class Bishop < Piece
  def initialize(is_white = true)
    super
    @is_white ? @img = "♝" : @img = "♗"
  end

  def correct_move?(x1, y1, x2, y2)

  end
end

class Knight < Piece
  def initialize(is_white = true)
    super
    @is_white ? @img = "♞" : @img = "♘"
  end

  def correct_move?(x1, y1, x2, y2)

  end
end

class Rook < Piece
  def initialize(is_white = true)
    super
    @is_white ? @img = "♜" : @img = "♖"
  end

  def correct_move?(x1, y1, x2, y2)

  end
end
