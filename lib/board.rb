class Board

  attr_accessor :cells

  def initialize
    self.reset!
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    sep = "-----------"
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts sep
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts sep
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    index = input.to_i
    position = @cells[index - 1]
  end

  def full?
    if @cells.all? { |cell| cell != " "  }
      true
    else
      false
    end
  end

  def turn_count
    counter = 0
    @cells.each do |cell|
      if cell != " "
        counter += 1
      end
    end
    counter
  end

  def taken?(input)
    if position(input) != " "
      true
    else
      false
    end
  end

  def valid_move?(input)
    num = input.to_i
    if (num > 0 && num <= 9) && !taken?(input)
      true
    else
      false
    end
  end

  def update(input, player)
    index = input.to_i
    if valid_move?(input)
      @cells[index - 1] = player.token
    else
      return nil 
    end
  end
end
