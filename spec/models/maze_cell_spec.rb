require 'rails_helper'

RSpec.describe MazeCell, type: :model do
  it { is_expected.to belong_to :maze_board }
end
