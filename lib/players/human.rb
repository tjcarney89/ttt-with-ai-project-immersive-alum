module Players
  class Human < Player

    def move(board)
      puts "Please enter position:"
      input = gets.strip
    end

  end

  class Computer < Player

    def move(board)
      count = board.turn_count
      if count == 0
        if board.valid_move?("5")
          "4"
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
        range = 1..9
        range.each do |num|
          i = num.to_s
          if board.valid_move?(i)
            i
            break
          end
        end
      end
    end

  end
end
