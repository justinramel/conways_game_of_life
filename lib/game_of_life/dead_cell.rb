module GameOfLife
  class DeadCell < Cell

    def tick(neighbours)
      three(neighbours) ? live_cell : dead_cell
    end

    def alive?
      false
    end

    def dead?
      true
    end

    def to_s
      ' '
    end

    private
    def three(neighbours)
      neighbours == 3
    end

  end
end
