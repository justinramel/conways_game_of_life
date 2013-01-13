require 'spec_helper'

module GameOfLife
  describe LiveCell do

    subject(:cell) { LiveCell.new }

    it { should be_alive }
    its(:to_s) { should eq("*") }

    context "has less than 2 live neighbours" do
      it "returns a dead cell" do
        [0,1].each do |number_of_neighbours|
          new_cell = cell.tick(number_of_neighbours)
          new_cell.should be_dead
        end
      end
    end

    context "has 2 or 3 live neighbours" do
      it "returns a live cell" do
        [2,3].each do |number_of_neighbours|
          new_cell = cell.tick(number_of_neighbours)
          new_cell.should be_alive
        end
      end
    end

    context "has more than 3 live neighbours" do
      it "returns a dead cell" do
        4.upto(8) do |number_of_neighbours|
          new_cell = cell.tick(number_of_neighbours)
          new_cell.should be_dead
        end
      end
    end

  end
end
