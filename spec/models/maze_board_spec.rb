require 'rails_helper'

RSpec.describe MazeBoard, type: :model do

  it { is_expected.to have_many :maze_cells }

  describe '.create_from_amaze' do
    let(:width)  { 4 }
    let(:height) { 8 }

    let(:grid) { Amaze.new(width, height) }

    it 'saves the board and its cells' do
      board = described_class.create_from_amaze(grid)
      expect(board).to have_attributes(start_x: grid.start_x, start_y: grid.start_y, end_x: grid.end_x, end_y: grid.end_y)
      expect(board.maze_cells.count).to eq(width * height)
    end
  end
end
