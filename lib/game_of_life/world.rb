module GameOfLife
  class World
    NEIGHBOURS = [
      [-1,-1],[-1, 0],[-1,1],
      [ 0,-1],        [ 0,1],
      [ 1,-1],[ 1, 0],[ 1,1]
    ]

    def initialize(cells, outputter=ConsoleOutput.new)
      @outputter        = outputter
      @cells            = cells
    end

    def tick
      new_cells = create_new_cells
      cells.each_with_index do |row, row_index|
        row.each_with_index do |col, col_index|
          number_alive = live_neighbours(row_index, col_index)
          new_cell = cells[row_index][col_index].tick(number_alive)
          new_cells[row_index][col_index] = new_cell
        end
      end
      self.cells = new_cells
      outputter.output(cells)
    end

    private
    attr_accessor :cells, :outputter

    def create_new_cells
      Array.new(cells.size) { Array.new(cells.first.size) }
    end

    def live_neighbours(x,y)
      NEIGHBOURS.inject(0) do |sum, (neighbour_x, neighbour_y)|
        neighbouring_cell = neighbour(x+neighbour_x, y+neighbour_y)
        sum += 1 if neighbouring_cell.alive?
        sum
      end
    end

    def neighbour(x,y)
      outside_world(x,y) ? DeadCell.new(x,y) : cells[x][y]
    end

    def outside_world(x,y)
      x < 0 or y < 0 or x > cells.size-1 || y > cells[x].size-1
    end

  end
end
