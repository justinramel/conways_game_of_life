require 'spec_helper'

module GameOfLife
  describe World do
    let(:live_cell) { LiveCell.new }
    let(:dead_cell) { DeadCell.new }
    let(:outputter) { ConsoleOutput.new(out) }
    let(:out) { StringIO.new }

    describe "oscillators" do
      context "blinker" do
        subject(:world) { World.new(blinker, outputter) }
        let(:blinker) {  [
          [dead_cell,dead_cell,dead_cell],
          [live_cell,live_cell,live_cell],
          [dead_cell,dead_cell,dead_cell]
        ] }
        before { world.tick }

        it "outputs a moving block" do
          out.string.should eq(" * \n * \n * \n")
        end
      end

      context "toad" do
        subject(:world) { World.new(toad, outputter) }
        let(:toad) { [
          [dead_cell,dead_cell,dead_cell,dead_cell],
          [dead_cell,live_cell,live_cell,live_cell],
          [live_cell,live_cell,live_cell,dead_cell],
          [dead_cell,dead_cell,dead_cell,dead_cell]
        ] }
        before { world.tick }

        it "outputs a moving block" do
          out.string.should eq("  * \n*  *\n*  *\n *  \n")
        end
      end
    end
  end
end
