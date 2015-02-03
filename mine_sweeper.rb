
class MineSweeperBoardstateModel
  attr_accessor :board
  attr_reader :board_length, :board_height

  def initialize(num_of_bombs, board_length = 30, board_height = 20)
    @board = []
    @board_length = board_length
    @board_height = board_height

    build_board(board_length, board_height)
    populate_board_mines(num_of_bombs)
    calculate_neighbor_mines
  end


  def show_board
    (@board_length).times { print "----" }
    puts " "
    @board.each do |row|
      row.each do |element|
        print "| #{element} "
      end
      puts "| "
      (@board_length).times { print "----" }
      puts "-"
    end
  end

  private

  # Side Note about avoidance of Array.new (Rather unnecessary but interesting nerd factor)
  # If Array.new is used, shallow cloned arrays will all update with duplicate nested arrays as per Ruby Docs 'Common Gotchas' in Array.new
  # Board Array is manually built here.
  def build_board(board_length, board_height)
    (board_height).times do
        row = []
      (board_length).times do
        row << " "
      end
      @board << row
    end
  end

  def populate_board_mines(num_of_bombs)
    if num_of_bombs <= board_height * board_length
      count = 1
      while count <= num_of_bombs do
        x_position = rand(board_length)
        y_position = rand(board_height)
        if @board[y_position][x_position] == " "
          @board[y_position][x_position] = '*'
          count +=1
        end
      end
    else
      raise "You cannot have more bombs than spaces for bombs. Decrease the bomb count-- that's just how it is."
    end
  end

  # There are a number of edge cases, as when we check a 0th index of either a row or any of the elements in 
  # the 0th row, but this rather gnarly method handles them all. I'm sorry anyone has to see this.
  # TODO Dry this method up, or encapsulate some of the code out into helper methods. Meh.
  def calculate_neighbor_mines
    @board.each_with_index do |row, row_index|
      row.each_with_index do |element, index|
        neighbor_bomb_count = 0
        if element != "*" && index == 0 && row_index == 0
          neighbor_bomb_count += 1 if @board[row_index][index + 1] && @board[row_index][index + 1] == "*"
          neighbor_bomb_count += 1 if @board[row_index + 1] && @board[row_index + 1][index] && @board[row_index + 1][index] == "*"
          neighbor_bomb_count += 1 if @board[row_index + 1] && @board[row_index + 1][index + 1] && @board[row_index + 1][index + 1] == "*"
          neighbor_bomb_count == 0 ? @board[row_index][index] = " " : @board[row_index][index] = neighbor_bomb_count
        elsif element != "*" && row_index == 0
          neighbor_bomb_count += 1 if @board[row_index][index - 1] && @board[row_index][index - 1] == "*"
          neighbor_bomb_count += 1 if @board[row_index][index + 1] && @board[row_index][index + 1] == "*"
          neighbor_bomb_count += 1 if @board[row_index + 1] && @board[row_index + 1][index - 1] && @board[row_index + 1][index - 1] == "*"
          neighbor_bomb_count += 1 if @board[row_index + 1] && @board[row_index + 1][index] && @board[row_index + 1][index] == "*"
          neighbor_bomb_count += 1 if @board[row_index + 1] && @board[row_index + 1][index + 1] && @board[row_index + 1][index + 1] == "*"
          neighbor_bomb_count == 0 ? @board[row_index][index] = " " : @board[row_index][index] = neighbor_bomb_count
        elsif element != "*"   && index == 0
          neighbor_bomb_count += 1 if @board[row_index - 1][index] && @board[row_index - 1][index] == "*"
          neighbor_bomb_count += 1 if @board[row_index - 1][index + 1] && @board[row_index - 1][index + 1] == "*"
          neighbor_bomb_count += 1 if @board[row_index][index + 1] && @board[row_index][index + 1] == "*"
          neighbor_bomb_count += 1 if @board[row_index + 1] && @board[row_index + 1][index] && @board[row_index + 1][index] == "*"
          neighbor_bomb_count += 1 if @board[row_index + 1] && @board[row_index + 1][index + 1] && @board[row_index + 1][index + 1] == "*"
          neighbor_bomb_count == 0 ? @board[row_index][index] = " " : @board[row_index][index] = neighbor_bomb_count
        elsif element != "*"
          neighbor_bomb_count += 1 if @board[row_index - 1][index - 1] && @board[row_index - 1][index - 1] == "*"
          neighbor_bomb_count += 1 if @board[row_index - 1][index] && @board[row_index - 1][index] == "*"
          neighbor_bomb_count += 1 if @board[row_index - 1][index + 1] && @board[row_index - 1][index + 1] == "*"
          neighbor_bomb_count += 1 if @board[row_index][index - 1] && @board[row_index][index - 1] == "*"
          neighbor_bomb_count += 1 if @board[row_index][index + 1] && @board[row_index][index + 1] == "*"
          neighbor_bomb_count += 1 if @board[row_index + 1] && @board[row_index + 1][index - 1] && @board[row_index + 1][index - 1] == "*"
          neighbor_bomb_count += 1 if @board[row_index + 1] && @board[row_index + 1][index] && @board[row_index + 1][index] == "*"
          neighbor_bomb_count += 1 if @board[row_index + 1] && @board[row_index + 1][index + 1] && @board[row_index + 1][index + 1] == "*"
          neighbor_bomb_count == 0 ? @board[row_index][index] = " " : @board[row_index][index] = neighbor_bomb_count
        end
      end
    end
  end

end

newboard = MineSweeperBoardstateModel.new(1, 3, 3)
newboard2 = MineSweeperBoardstateModel.new(15, 12, 12)
newboard3 = MineSweeperBoardstateModel.new(100, 40, 20)
newboard.show_board
newboard2.show_board
newboard3.show_board
# p newboard2
