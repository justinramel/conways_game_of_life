require 'spec_helper'

module GameOfLife
  describe Game do
    subject(:game) { Game.new(:gosper_glider_gun, 50, god) }
    let(:god) { fake }

    context "create" do
      before { game }

      it "tells god to create the world with the pattern and size" do
        god.should have_received(:create_cells, :gosper_glider_gun, 50)
      end
    end

    describe "play" do
      let(:world) { fake }
      before { god.stub(:create_world).and_return(world) }
      before { game.play(10) }

      it "calls tick on the world" do
        world.should have_received(:tick).exactly(10)
      end
    end
  end
end
