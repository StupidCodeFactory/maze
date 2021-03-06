class Amaze

  attr_accessor :start_x, :start_y, :end_x, :end_y, :width, :height, :grid

  def self.load_from_db(maze_board)
    maze = new(maze_board.width, maze_board.height)
    maze.start_x = maze_board.start_x
    maze.start_y = maze_board.start_y
    maze.end_x   = maze_board.end_x
    maze.end_y   = maze_board.end_y

    maze_board.maze_cells.each do |maze_cell|
      maze.cell_at(maze_cell.x, maze_cell.y).walls = maze_cell.walls
    end
    maze
  end

  def initialize(w, h)
    self.width                = w.to_i
    self.height               = h.to_i
    self.start_x              = rand(width)
    self.start_y              = 0
    self.grid                 = Array.new(height) { |y| Array.new(width) { |x| Cell.new(x,y, self)} }
    self.visisted_cells_stack = []
    self.end_x                = rand(width)
    self.end_y                = height - 1
  end

  def rows
    grid
  end

  def cell_at(x, y)
    return if [x, y].min < 0
    grid[y] && grid[y][x]
  end

  def generate
    visit_cells(grid[start_y][start_x])
  end

  private

  attr_accessor  :visisted_cells_stack

  def visit_cells(cell)
    if direction = cell.unvisited_random_direction
      new_cell = cell.connect_to(direction)
      new_cell.visit!
      visisted_cells_stack.push(new_cell)
      visit_cells(new_cell)
    else
      new_cell = visisted_cells_stack.pop
      visit_cells(new_cell) if new_cell
    end

  end
end
