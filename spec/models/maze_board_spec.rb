require 'rails_helper'

RSpec.describe MazeBoard, type: :model do

  let(:width)  { 4 }
  let(:height) { 8 }
  let(:grid) { Amaze.new(width, height) }

    subject { described_class.create_from_amaze(grid) }

  it { is_expected.to have_many :maze_cells }
  describe '.create_from_amaze' do

    it 'saves the board and its cells' do
      expect(subject).to have_attributes(start_x: grid.start_x, start_y: grid.start_y, end_x: grid.end_x, end_y: grid.end_y)
      expect(subject.maze_cells.count).to eq(width * height)
    end
  end

  describe '#height' do
    it 'calculates its height from cells' do
      expect(subject.height).to eq(height)
    end
  end

  describe '#width' do
    it 'calculates its width from cells' do
      expect(subject.width).to eq(width)
    end
  end

end
