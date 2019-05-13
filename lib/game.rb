class Game
  attr_accessor :board, :player_1, :player_2

<<<<<<< HEAD
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even? ? @player_1 : @player_2
  end

  def position_taken?(index)
    @board.cells[index] != " "
  end

  def turn
    player = current_player

    puts "Please input a number 1-9:"

    turn_move = player.move(@board)

    if !board.valid_move?(turn_move)
      turn_move = player.move(@board)
    end

    @board.update(turn_move, player)
    @board.display
  end

  def won?
    WIN_COMBINATIONS.each do |win|
      if @board.cells[win[0]] == @board.cells[win[1]] && @board.cells[win[1]] == @board.cells[win[2]] && @board.cells[win[0]] != " "
        return win
      end
    end
    false
=======
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,4,8], [2,4,6], [0,3,6], [1,4,7], [2,5,8]
  ]

  def initialize(player_1, player_2, board=nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def current_player
  end

  def won?
    WIN_COMBINATIONS.detect do |place|
      @board[place[0]] == @board[place[1]] &&
      @board[place[1]] == @board[place[2]] &&
      position_taken?(place[0]) #review this line
   end
  end

  def winner
    if win_combination = won?
      return @board[win_combination.first]
    end
  end

  def start
  end

  def play
    until over?
      turn
    end

    if winner
      puts "Congratulations #{winner}!"
    else draw?
      puts "Cat's Game!"
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input.to_i-1

    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
>>>>>>> dd031b2758bb202d54c6985d8719a88438a342d8
  end

  def full?
    @board.all? do |token| token == "X" || token == "O"
    end
  end

  def draw?
<<<<<<< HEAD
    !won? && @board.full?
  end

  def over?
    draw? || won?
  end

  def winner #review this method again
    winner_token = won?
    winner_token ? @board.cells[winner_token[0]] : nil
  end

  def play
    until over?
      turn
    end

    if draw?
      puts "Cat's Game!"
    else won? != nil
      puts "Congratulations #{winner}!"
    end
  end
=======
    !won? && full?
  end

  def over?
    won? || draw? || full?
  end

>>>>>>> dd031b2758bb202d54c6985d8719a88438a342d8
end
