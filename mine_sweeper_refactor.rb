class MineSweeperBoardstateModel

  def initialize(num_of_bombs, board_width = 30, board_height = 20)
    @board = []

    create_empty_board(board_height, board_width)
    populate_mines(num_of_bombs)
    populate_neighbor_mine_count
    view_board
  end

  private

  def create_empty_board(board_height, board_width)
    board_height.times {@board << Array.new(board_width, " ")}
  end

  def populate_mines(num_of_bombs)
    num_of_bombs <= (@board[0].count * @board.count) ? true : (raise "You cannot have more bombs than spaces for bombs.")
    while @board.reduce(:+).select{|bomb| bomb == "*"}.count < num_of_bombs
      @board[rand(@board.count)][rand(@board[0].count)] = "*"
    end
  end

  def populate_neighbor_mine_count
    @board.each_with_index do |row, row_index|
      row.each_with_index do |element, i|
        if element != "*"
          neighbor_bomb_count = 0
          neighbor_bomb_count += 1 if @board[row_index - 1][i - 1] == "*" unless i == 0 || row_index == 0 #check up_and_left
          neighbor_bomb_count += 1 if @board[row_index - 1][i] == "*" unless row_index == 0 #check up
          neighbor_bomb_count += 1 if @board[row_index - 1][i + 1] == "*" unless row_index == 0 #check up_and_right
          neighbor_bomb_count += 1 if @board[row_index][i - 1] == "*" unless i == 0 #check left
          neighbor_bomb_count += 1 if @board[row_index][i + 1] == "*" #check right
          neighbor_bomb_count += 1 if @board[row_index + 1][i - 1] == "*" unless i == 0 || row_index == @board.count - 1 #check down_and_left
          neighbor_bomb_count += 1 if @board[row_index + 1][i] == "*" unless row_index == @board.count - 1 #check down
          neighbor_bomb_count += 1 if [row_index + 1][i + 1] == "*" unless row_index == @board.count - 1 #check down_and_right
          @board[row_index][i] = neighbor_bomb_count if neighbor_bomb_count > 0 #insert count or whitespace
        end
      end
    end
  end

  def view_board
    @board[0].count.times { print "---"}; puts "--"
    @board.map do |row|
      print "|"
      row.map {|el| print " #{el} "}; puts "|"
    end
    @board[0].count.times { print "---"}; puts "--"
  end

end
newboard = MineSweeperBoardstateModel.new(1, 3, 3)
newboard2 = MineSweeperBoardstateModel.new(15, 12, 12)
newboard3 = MineSweeperBoardstateModel.new(100, 40, 20)
