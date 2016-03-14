require "rails_helper"

RSpec.describe Amaze do
  let(:width)  { 4 }
  let(:height) { 8 }
  subject { described_class.new(width, height) }

  it 'takes a width and heigth' do
    expect { subject }.to_not raise_error
  end

  describe '.load_from_db' do
    let(:maze_board) { puts "board"; MazeBoard.create_from_amaze(subject) }

    before do
      subject.generate
      maze_board
    end

    it 'reloads the maze' do
      maze = described_class.load_from_db(maze_board)

      expect(maze.start_x).to eq(maze_board.start_x)
      expect(maze.start_y).to eq(maze_board.start_y)
      expect(maze.end_x).to   eq(maze_board.end_x)
      expect(maze.end_y).to   eq(maze_board.end_y)

      maze.rows.each do |row|
        row.each do |cell|
          expect(maze_board.maze_cells.where(x: cell.x, y: cell.y, walls: cell.walls)).to be_exist
        end
      end
    end
  end

  describe '#cell_at' do
    it 'finds the cell at (x, y) coordinates' do
      expect(subject.cell_at(1,2).to_a).to eq([1,2])
    end

    context 'with out of bounds coordonates' do
      it 'returns nil' do
        expect(subject.cell_at(2))
      end
    end
  end

  describe 'when initialized' do

    describe '#generate' do
      it 'generate maze' do
        subject.generate
      end
    end

  end
end
