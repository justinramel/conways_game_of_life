require 'spec_helper'

module GameOfLife
  describe DeadCell do
    subject(:cell) { DeadCell.new }

    it { should be_dead }
    its(:to_s) { should eq(" ") }

    context "with exactly 3 live neighbours" do
      it "returns a live cell" do
        new_cell = cell.tick(3)
        new_cell.should be_alive
      end
    end

    context "with anything other than 3 live neighbours" do
      it "returns a dead cell" do
        new_cell = cell.tick(1)
        new_cell.should be_dead
      end
    end

  end
end
