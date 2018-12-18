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
    is_white ? @img = "♙" : @img = "♟"
  end
end

class King < Piece
  def initialize(is_white = true)
    super
    is_white ? @img = "♔" : @img = "♚"
  end
end

class Queen < Piece
  def initialize(is_white = true)
    super
    is_white ? @img = "♕" : @img = "♛"
  end
end

class Bishop < Piece
  def initialize(is_white = true)
    super
    is_white ? @img = "♗" : @img = "♝"
  end
end

class Knight < Piece
  def initialize(is_white = true)
    super
    is_white ? @img = "♘" : @img = "♞"
  end
end

class Rook < Piece
  def initialize(is_white = true)
    super
    is_white ? @img = "♖" : @img = "♜"
  end
end
