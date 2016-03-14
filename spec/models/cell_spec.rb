require "rails_helper"

RSpec.describe Cell do
  let(:grid) { Amaze.new(4,5) }
  let(:x) { 1 }
  let(:y) { 3 }

  subject { described_class.new(x, y, grid) }

  describe '#neighbours' do

    let(:neighbours) { subject.neighbours.map(&:to_a) }

    it 'contains the EAST cell' do
      expect(neighbours).to include([x - 1, y])
    end

    it 'contains the WEST cell' do
      expect(neighbours).to include([x + 1, y])
    end

    it 'contains the NORTH cell' do
      expect(neighbours).to include([x, y - 1])
    end

    it 'contains the SOUTH cell' do
      expect(neighbours).to include([x, y + 1])
    end

  end

  describe '#start?' do

    context 'being the maze starting cell' do

      before do
        expect(grid).to receive(:start_x).and_return(x)
        expect(grid).to receive(:start_y).and_return(y)
      end

      it { is_expected.to be_start }
    end

    context 'not being the maze starting cell' do

      before { expect(grid).to receive(:start_x).and_return(x + 1) }

      it { is_expected.to_not be_start }
    end

  end

  describe '#end?' do
    context 'being the maze solution cell' do

      before do
        expect(grid).to receive(:end_x).and_return(x)
        expect(grid).to receive(:end_y).and_return(y)
      end

      it { is_expected.to be_end }
    end

    context 'not being the maze solution cell' do

      before { expect(grid).to receive(:end_x).and_return(x) }

      it { is_expected.to_not be_end }
    end
  end

  describe '#unvisited_random_direction' do

    describe 'with a border cell' do
      let(:x) { 0 }
      let(:y) { 0 }

      it 'returns only west and south' do
        10.times do
          expect(subject.unvisited_random_direction).to eq(Cell::WEST).or eq(Cell::SOUTH)
        end

      end
    end

    describe 'with unvisited neightbours' do

      before do
        subject.connect_to(Cell::EAST).visit!
        subject.connect_to(Cell::WEST).visit!
      end

      it 'returns a random unvisited direction' do
        10.times do
          expect(subject.unvisited_random_direction).to eq(Cell::NORTH).or eq(Cell::SOUTH)
        end
      end
    end
  end

  describe '#visit!' do

    it 'marks cell as visited' do
      expect {subject.visit! }.to change { subject.visited? }.from(false).to(true)
    end

  end

  describe '#visited?' do
    describe 'with a visited cell' do
      before { subject.visit! }
      it { is_expected.to be_visited }
    end

    describe 'with a not visitied cell' do
      it { is_expected.to_not be_visited }
    end
  end

  describe '#connect_to' do
    context 'with an adjacent cell' do
      it 'returns the connected cell' do
        expect(subject.connect_to(described_class::EAST)).to be_instance_of(Cell)
      end

      it 'connects the cell' do
        cell = subject.connect_to(described_class::SOUTH)
        expect(cell.walls & described_class::NORTH).to eq(described_class::NORTH)
      end
    end
  end

  describe '#klass' do
    context 'with come connections' do

      it 'has the north class' do
        subject.connect_to(described_class::EAST)
        expect(subject.klass).to include('east')
      end

    end

    context 'when the start cell' do

      before do
        expect(grid).to receive(:start_x).and_return(x)
        expect(grid).to receive(:start_y).and_return(y)
      end

      it 'has the start klass' do
        expect(subject.klass).to include('start')
      end
    end

    context 'when the end cell' do

      before do
        expect(grid).to receive(:end_x).and_return(x)
        expect(grid).to receive(:end_y).and_return(y)
      end

      it 'has the start klass' do
        expect(subject.klass).to include('end')
      end

    end
  end
end
