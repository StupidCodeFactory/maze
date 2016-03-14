require 'pp'

class Amaze

  attr_accessor :start_x, :start_y, :end_x, :end_y, :width, :height

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

  attr_accessor  :grid, :visisted_cells_stack

  def visit_cells(cell)

    if direction = cell.unvisited_random_direction
      new_cell = cell.connect_to(direction)
      new_cell.visit!
      visisted_cells_stack.push(new_cell)
      visit_cells(new_cell)
    else
      # self.end_x, self.end_y = cell.to_a
      new_cell = visisted_cells_stack.pop
      visit_cells(new_cell) if new_cell
    end

  end
end
