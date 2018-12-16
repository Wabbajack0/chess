class Piece
  attr_accessor :is_white

  def initialize(is_white = true)
    @is_white = is_white
  end

end

class Pawn < Piece
  @@img = "P"
  def img
    @@img
  end
end

class King < Piece
  @@img = "K"
  def img
    @@img
  end
end

class Queen < Piece
  @@img = "Q"
  def img
    @@img
  end
end

class Bishop < Piece
  @@img = "B"
  def img
    @@img
  end
end

class Knight < Piece
  @@img = "N"
  def img
    @@img
  end
end

class Rook < Piece
  @@img = "R"
  def img
    @@img
  end
end
