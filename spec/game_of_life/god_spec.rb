require 'spec_helper'

module GameOfLife
  describe God do
    subject(:god) { God.new }
    let(:pattern_name) { :gosper_glider_gun }
    let(:cells) { fake }

    it "creates cells given a starting pattern" do
      cells = god.create_cells(pattern_name, 50)
      cells[0][0].should be_dead

      cells[0][24].should be_dead
      cells[0][25].should be_alive
      cells[0][26].should be_dead

      cells[8][12].should be_dead
      cells[8][13].should be_alive
      cells[8][14].should be_dead

      cells[49][49].should be_dead
    end

    it "creates world given cells" do
      world = god.create_world(cells)
      world.should be_kind_of(World)
    end
  end
end
