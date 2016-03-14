class MazeBoardsController < ApplicationController
  def show
    height = width = 16
    @maze = Amaze.new(width, height)
    @maze.generate
  end
end
