require "rails_helper"

RSpec.describe Amaze do
  let(:width)  { 12 }
  let(:height) { 10 }
  subject { described_class.new(width, height) }

  it 'takes a width and heigth' do
    expect { subject }.to_not raise_error
  end

  describe 'when initialized' do

    describe '#rows' do
      it 'returns the columns' do
      end
    end

  end
end
