class Cell

  EAST  = 0b0001
  WEST  = 0b0010
  NORTH = 0b0100
  SOUTH = 0b1000

  NEIGHBOURS_SIZE = 4

  def initialize(x, y, grid)
    self.x       = x
    self.y       = y
    self.walls   = 0b000
    self.visited = false
    self.grid    = grid
  end

  def neighbours
    [east, west, north, south]
  end

  def unvisited_random_direction
    u = [[east, EAST], [west, WEST], [north, NORTH], [south, SOUTH]].inject([]) do |dirs, cell_and_direction|
      dirs << cell_and_direction.last if !cell_and_direction.first.visited?
      dirs
    end
    u.sample
  end

  def connect_to(direction)

    case direction
    when EAST
      self.walls |= EAST
      east
    when WEST
      self.walls |= WEST
      west
    when NORTH
      self.walls |= NORTH
      north
    when SOUTH
      self.walls |= SOUTH
      south
    else
      raise ArgumentError
    end

  end

  def visit!
    self.visited = true
  end

  def visited?
    visited
  end

  def to_a
    [x, y]
  end

  private

  attr_accessor :x, :y, :walls, :visited, :grid

  def east
    @east ||= grid.cell_at(*east_coordinates)
  end

  def west
    @west ||= grid.cell_at(*west_coordinates)
  end

  def north
    @north ||= grid.cell_at(*north_coordinates)
  end

  def south
    @south ||= grid.cell_at(*south_coordinates)
  end

  def east_coordinates
    [x - 1, y]
  end

  def west_coordinates
    [x + 1, y]
  end

  def north_coordinates
    [x, y - 1]
  end

  def south_coordinates
    [x, y + 1]
  end
end
