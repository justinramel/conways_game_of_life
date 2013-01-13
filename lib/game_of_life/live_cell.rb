module GameOfLife
  class LiveCell < Cell

    def tick(neighbours)
      two_or_three(neighbours) ? live_cell : dead_cell
    end

    def alive?
      true
    end

    def dead?
      false
    end

    def to_s
      "*"
    end

    private
    def two_or_three(neighbours)
      neighbours == 2 || neighbours == 3
    end

  end
end
