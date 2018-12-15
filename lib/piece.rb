class Piece
  attr_accessor :is_white

  @@img = nil

  def initialize(is_white = true)
    @is_black = is_white
  end

  def img
    @@img
  end

end

class Pawn < Piece
  @@img = "P"
end

class King < Piece
  @@img = "K"
end

class Queen < Piece
  @@img = "Q"
end

class Bishop < Piece
  @@img = "B"
end

class Knight < Piece
  @@img = "N"
end

class Rook < Piece
  @@img = "R"
end
