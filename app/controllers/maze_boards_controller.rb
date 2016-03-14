class MazeBoardsController < ApplicationController

  def new
    @maze_form = MazeForm.new(height: 6, width: 8)
  end

  def show
    @maze_board = MazeBoard.includes(:maze_cells).order('maze_cells.x ASC, maze_cells.y ASC').find(params[:id])
    @maze       = Amaze.load_from_db(@maze_board)
  end

  def create
    @maze_form = MazeForm.new(maze_form_params)
    if @maze_form.save
      redirect_to @maze_form.maze
    end
  end

  private

  def maze_form_params
    params.require(:maze_form).permit(:height, :width)
  end
end
