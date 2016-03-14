require "rails_helper"
# , js: true
RSpec.describe Maze, type: :feature do

  describe 'create a new maze' do
    it 'creates a new maze' do
      visit root_path

      fill_in 'Width',  with: 6
      fill_in 'Height', with: 8
      click_on 'Create'

      board = MazeBoard.first
      board.rows.count
      rows = page.all('tr')
      expect(rows.size).to eq(8)
    end
  end

  describe 'solving a maze' do

    describe 'step by step' do
    end
  end

end
