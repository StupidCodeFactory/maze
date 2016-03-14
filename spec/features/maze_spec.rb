require "rails_helper"
# , js: true
RSpec.describe Maze, type: :feature do

  it 'creates and solve a maze' do
    visit root_path

    fill_in 'Width',  with: 6
    fill_in 'Height', with: 8
    click_on 'Create'

    board = MazeBoard.first
    board = Amaze.load_from_db(board)

    rows = page.all('tr')
    expect(rows.size).to eq(board.rows.count)

    click_on 'Solve'
  end

end
