require "rails_helper"

RSpec.describe Maze, type: :feature, js: true do

  describe 'create a new maze' do
    it 'creates a new maze' do
      visit root_path
      click_on 'Create Maze Board'
    end
  end

  describe 'solving a maze' do

    describe 'step by step' do
    end
  end

end
