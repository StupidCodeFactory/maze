class SolvesController < ApplicationController
  def create
    @maze_board = MazeBoard.includes(:maze_cells).order('maze_cells.x ASC, maze_cells.y ASC').find(params[:maze_board_id])
    @maze       = Amaze.load_from_db(@maze_board)
    @maze.solve
  end
end
