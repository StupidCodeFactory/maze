require "rails_helper"

RSpec.describe MazeForm, type: :model do

  subject { described_class.new(height: 5, width: 5) }

  it { is_expected.to have_attributes height: 5, width: 5 }

  describe 'validation' do

    it { is_expected.to be_valid }

    it { is_expected.to validate_numericality_of(:height).is_greater_than(4) }
    it { is_expected.to validate_numericality_of(:width).is_greater_than(4) }
  end
end
