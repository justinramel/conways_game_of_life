require 'spec_helper'

module GameOfLife
  describe ConsoleOutput do
    subject(:console) { ConsoleOutput.new(output) }
    let(:output) { StringIO.new }
    before { console.output([[LiveCell.new, LiveCell.new],
                             [LiveCell.new, LiveCell.new]]) }

    it "prints the cells" do
      output.string.should eq("**\n**\n")
    end

  end
end
