class MazeBoard < ActiveRecord::Base
  has_many :maze_cells

  attr_accessor :height, :width

  def self.create_from_amaze(grid)
    board = new(start_x: grid.start_x, start_y: grid.start_y, end_x: grid.end_x, end_y: grid.end_y)

    transaction do
      grid.rows.each do |row|
        row.each do |cell|
          board.maze_cells.new(x: cell.x, y: cell.y, walls: cell.walls)
        end
      end
      board.save
    end

    board
  end

  def height
    maze_cells.maximum(:y) + 1
  end

  def width
    maze_cells.maximum(:x) + 1
  end
end
