require_relative "nullpiece"

class Board

  def initialize
    @rows = Array.new(8) { Array.new(8) }
    @nullpiece = nil
  end

  def set_up_board
    (0..7).each do |row|
      (0..7).each do |col|
         if row == 0 || row == 1
          @rows[row][col] = Piece.new(:B, self, [row,col])
         elsif  row == 6 || row == 7 
          @rows[row][col] = Piece.new(:W, self, [row,col])
         else
          @rows[row][col] = NullPiece.new(:-, self, [row,col])
         end
      end
    end
  end

  def move_piece(start_pos, end_pos)
    #checks
    nums = (0..7).to_a
    coordinates = start_pos + end_pos
    raise "invalid position" if coordinates.any? { |i| !nums.include?(i) }
    raise "no piece in position" if self[start_pos].is_a?(NullPiece)

    #swap
    temp = self[end_pos]
    self[end_pos] = self[start_pos]
    self[start_pos] = temp
  end

  #----------others-------------------------#

  def [](pos)
    row, col = pos
    @rows[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @rows[row][col] = value
  end

  def render
    print " " 
    (0..7).each { |i| print " #{i}" }
    puts

    (0..7).each do |row|
      print "#{row}" 
      (0..7).each do |col|
        print " #{@rows[row][col].color}"
      end
      puts
    end
  end

  attr_reader :rows
end

b = Board.new
b.set_up_board
b.render

#

# b.move_piece([0,0],[2,1]) 

# b.move_piece([0,0],[9,1]) #invalid move

b.move_piece([2,1],[0,0]) #no piece

b.render