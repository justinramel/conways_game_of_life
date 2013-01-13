module GameOfLife
  class God
    def create_cells(pattern_name, size)
      cells = Array.new(size) { Array.new(size) { DeadCell.new } }
      pattern = PATTERNS[pattern_name]
      pattern.lines.each_with_index do |line, line_index|
        line.chars.each_with_index do |char, char_index|
          cells[line_index][char_index] = LiveCell.new if char == '*'
        end
      end
      cells
    end

    def create_world(cells)
      World.new(cells)
    end
  end
end
