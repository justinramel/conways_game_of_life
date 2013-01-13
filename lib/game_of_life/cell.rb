module GameOfLife
  class Cell
    attr_reader :x, :y

    def initialize(x=0, y=0)
      @x = x
      @y = y
    end

    def live_cell
      LiveCell.new(x,y)
    end

    def dead_cell
      DeadCell.new(x,y)
    end

    def self.dead
      DeadCell.new
    end
  end
end
