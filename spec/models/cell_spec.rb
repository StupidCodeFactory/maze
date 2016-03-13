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

  describe '#unvisited_random_direction' do
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
      expect(subject.visit!).to be true
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
    context 'with an already connected' do

      before { subject.connect_to(described_class::EAST) }

      # it 'raise an AlreadyConnected error' do
      #   expect { subject.connect_to(described_class::EAST) }.to raise_error(ArgumentError, "Cell (#{x}, #{y}) already connected")
      # end
    end
    context 'with an adjacent cell' do
      it 'connects the two cells' do
        expect(subject.connect_to(described_class::EAST)).to be_instance_of(Cell)
      end
    end
  end

end
