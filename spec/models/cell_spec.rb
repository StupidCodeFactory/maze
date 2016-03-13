require "rails_helper"

RSpec.describe Cell do

  let(:x) { 1 }
  let(:y) { 3 }

  subject { described_class.new(x,y) }

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

  describe '#connect_to' do
    context 'with an adjacent cell' do
      it 'connects the two cells' do
        expect(subject.connect_to(described_class::EAST)).to be_instance_of(Cell)
      end
    end
  end

end
