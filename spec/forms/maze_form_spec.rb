require "rails_helper"

RSpec.describe MazeForm, type: :model do
  let(:width)  { 5 }
  let(:height) { 5 }

  subject { described_class.new(height: height, width: width) }

  it { is_expected.to have_attributes height: 5, width: 5 }

  describe 'validation' do

    it { is_expected.to be_valid }

    it { is_expected.to validate_numericality_of(:height).is_greater_than(4) }
    it { is_expected.to validate_numericality_of(:width).is_greater_than(4) }
  end

  describe '#save' do

    it 'generates a maze' do
      expect { subject.save }.to change { MazeBoard.count }.by(1)
    end

    describe 'checks for validity' do

      let(:height) { 3 }

      it 'does not generates a maze' do
        expect { subject.save }.to_not change { MazeBoard.count }
      end

      it 'returns false' do
        expect(subject.save).to be false
      end
    end
  end
end
