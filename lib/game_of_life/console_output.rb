module GameOfLife
  class ConsoleOutput
    def initialize(out=STDOUT)
      @out = out
    end

    def output(cells)
      system('clear')
      cells.each { |row| out.puts row.join }
    end

    private
    attr_accessor :out
  end
end
