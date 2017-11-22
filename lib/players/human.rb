require 'pry'

module Players
  class Human < Player

    def move(board)
      puts "Please enter position:"
      input = gets.strip
    end

  end

  class Computer < Player

    WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

    def move(board)
      count = board.turn_count
      if count == 0 || count == 1
        if board.valid_move?("5")
          "5"
        elsif board.valid_move?("1")
          "1"
        elsif board.valid_move?("3")
          "3"
        elsif board.valid_move?("7")
          "7"
        elsif board.valid_move?("9")
          "9"
        end
      else
        WIN_COMBINATIONS.each do |combo|
          if (board.cells[combo[0]] == self.token && board.cells[combo[1]] == self.token) && board.valid_move?(combo[2] + 1)
            return combo[2] + 1
            break
          elsif (board.cells[combo[0]] == self.token && board.cells[combo[2]] == self.token) && board.valid_move?(combo[1] + 1)
            return combo[1] + 1
            break
          elsif (board.cells[combo[1]] == self.token && board.cells[combo[2]] == self.token) && board.valid_move?(combo[0] + 1)
            return combo[0] + 1
            break
          elsif (board.cells[combo[0]] != self.token && board.cells[combo[0]] != " ") && (board.cells[combo[1]] != self.token && board.cells[combo[1]] != " ") && board.valid_move?(combo[2])
            return combo[2] + 1
            break
          elsif (board.cells[combo[0]] != self.token && board.cells[combo[0]] != " ") && (board.cells[combo[2]] != self.token && board.cells[combo[2]] != " ") && board.valid_move?(combo[1])
            return combo[1] + 1
            break
          elsif (board.cells[combo[1]] != self.token && board.cells[combo[1]] != " ") && (board.cells[combo[2]] != self.token && board.cells[combo[2]] != " ") && board.valid_move?(combo[0])
            return combo[0] + 1
            break
          end
        end
      end

      options = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      loop do
        random = options.sample
        if board.valid_move?(random)
          return random
          break
        end
      end


      #range.each do |num|
        #i = num.to_s
        #if board.valid_move?(i)
          #return i
          #break
        #end
      #end
    end
  end
end
