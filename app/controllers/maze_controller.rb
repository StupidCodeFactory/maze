class MazeController < ApplicationController
  def show
    height = width = 12
    @maze = Array.new(height) { Array.new(width, 0) }

  end
end
