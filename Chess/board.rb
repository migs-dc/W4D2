require_relative "piece"

class Board

  def initialize

    @rows = Array.new(8) { Array.new(8) }
    @nullpiece = nil

    set_up_board

  end

  def set_up_board
    (0...8).each do |row|
      (0...8).each do |col|
         if row == 0 || row == 1
          @rows[row][col] = Piece.new("black", nil, [row,col])
         elsif  row == 6 || row == 7 
          @rows[row][col] = Piece.new("white", nil, [row,col])
         else
          @rows[row][col] = NullPiece.new
         end
      end
    end
  end

  def move_piece(start_pos, end_pos)
    
  end

  def [](pos)
    row, col = pos
    @rows[row][col]
  end

end

