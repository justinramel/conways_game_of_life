require 'spec_helper'

module GameOfLife
  describe Cell do
    subject(:cell) { Cell.new(1,2) }

    its(:x) { should eq(1) }
    its(:y) { should eq(2) }
  end
end
