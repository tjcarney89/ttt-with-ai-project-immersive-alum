require_relative "../config/environment.rb"

class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

  def initialize(player_1=nil, player_2=nil, board=nil)
    if board == nil
      @board = Board.new
    else
      @board=  board
    end

    if player_1 == nil
      @player_1 = Players::Human.new("X")
    else
      @player_1 = player_1
    end

    if player_2 == nil
      @player_2 = Players::Human.new("O")
    else
      @player_2 = player_2
    end
  end

  def board
    @board
  end

  def player_1
    @player_1
  end

  def player_2
    @player_2
  end

  def current_player
    count = board.turn_count
    if count % 2 == 0
      @player_1
    else
      @player_2
    end
  end

  def play
    counter = 0
    game_over = over?
    while counter < 9
      counter += 1
      if game_over == false
          turn
          game_over = over?
          if game_over == true
            if won?
              game_winner = winner
              puts "Congratulations #{game_winner}!"
            elsif draw?
              puts "Cat's Game!"
            end
            break
          end
      else
        if won?
          game_winner = winner
          puts "Congratulations #{game_winner}!"
        elsif draw?
          puts "Cat's Game!"
        end
        break
      end
    end
  end

  def turn
    player = current_player
    input = player.move(@board)
    if @board.valid_move?(input)
      @board.update(input, player)
    else
      player.move(@board)
    end

  end

  def over?
    if draw? || won? != false
      true
    else
      false
    end
  end

  def won?
    if winner != nil
      winning_combo = []
      WIN_COMBINATIONS.each do |combo|
        if @board.cells[combo[0]] == "X" && @board.cells[combo[1]] == "X" && @board.cells[combo[2]] == "X"
          winning_combo = combo
          break
        elsif @board.cells[combo[0]] == "O" && @board.cells[combo[1]] == "O" && @board.cells[combo[2]] == "O"
          winning_combo = combo
          break
        end
      end
      winning_combo
    else
      false
    end
  end

  def draw?
    if @board.full? && winner == nil
      true
    else
      false
    end
  end

  def winner
    game_winner = nil
    WIN_COMBINATIONS.each do |combo|
      if @board.cells[combo[0]] == "X" && @board.cells[combo[1]] == "X" && @board.cells[combo[2]] == "X"
        game_winner = "X"
      elsif @board.cells[combo[0]] == "O" && @board.cells[combo[1]] == "O" && @board.cells[combo[2]] == "O"
          game_winner = "O"
      end
    end
    game_winner
  end


end
