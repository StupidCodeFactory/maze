require "rails_helper"
# , js: true
RSpec.describe Maze, type: :feature do

  describe 'create a new maze' do
    it 'creates a new maze' do
      visit root_path
      click_on 'Create'
    end
  end

  describe 'solving a maze' do

    describe 'step by step' do
    end
  end

end
