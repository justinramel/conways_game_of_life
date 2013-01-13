require 'spec_helper'

module GameOfLife
  describe World do
    subject(:world) { World.new(cells, outputter) }
    let(:live_cell) { fake(alive?:true) }
    let(:dead_cell) { fake(alive?:false) }
    let(:outputter) { fake }

    describe "neighbours" do
      context "zero live neighbours" do
        let(:cells) { [[live_cell,dead_cell]] }
        before { world.tick }

        it "tells its cells to tick with number of live neighbours" do
          live_cell.should have_received(:tick, 0)
        end
      end

      context "one live neighbour" do
        let(:cells) { [[live_cell, live_cell]] }
        before { world.tick }

        it "tells its cells to tick with number of live neighbours" do
          live_cell.should have_received(:tick, 1)
        end
      end

      context "two live neighbours" do
        let(:cells) { [[live_cell, live_cell, live_cell]] }
        before { world.tick }

        it "tells its cells to tick with number of live neighbours" do
          live_cell.should have_received(:tick, 2)
        end
      end

      context "eight live neighbours" do
        let(:cells) { [
          [live_cell, live_cell, live_cell],
          [live_cell, live_cell, live_cell],
          [live_cell, live_cell, live_cell]
        ] }
        before { world.tick }

        it "tells its cells to tick with number of live neighbours" do
          live_cell.should have_received(:tick, 8)
        end
      end
    end
  end
end
