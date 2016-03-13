require "rails_helper"

RSpec.describe Cell do

  let(:x) { 1 }
  let(:y) { 3 }

  subject { described_class.new(x,y) }

  describe '#neighbours' do

    it 'contains the EAST cell' do
      expect(subject.neighbours.to_a).to include([x - 1, y])
    end

    it 'contains the WEST cell' do
      expect(subject.neighbours.to_a).to include([x + 1, y])
    end

    it 'contains the NORTH cell' do
      expect(subject.neighbours.to_a).to include([x, y - 1])
    end

    it 'contains the SOUTH cell' do
      expect(subject.neighbours.to_a).to include([x, y + 1])
    end

  end

  describe '#connect' do
    context 'with an adjacent cell' do

    end
  end

end
