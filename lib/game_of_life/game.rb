module GameOfLife
  class Game
    def initialize(pattern_name, size, god=God.new)
      cells  = god.create_cells(pattern_name, size)
      @world = god.create_world(cells)
    end

    def play(rounds)
      rounds.times do
        world.tick
        sleep(0.2)
      end
    end

    private
    attr_accessor :world
  end
end
