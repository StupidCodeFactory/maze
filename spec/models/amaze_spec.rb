require "rails_helper"

RSpec.describe Amaze do
  let(:width)  { 4 }
  let(:height) { 8 }
  subject { described_class.new(width, height) }

  it 'takes a width and heigth' do
    expect { subject }.to_not raise_error
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
