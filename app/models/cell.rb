class Cell

  EAST  = 0b0001
  WEST  = 0b0010
  NORTH = 0b0100
  SOUTH = 0b1000

  NEIGHBOURS_SIZE = 4

  attr_accessor :walls, :x, :y

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
    [[east, EAST], [west, WEST], [north, NORTH], [south, SOUTH]].inject([]) do |dirs, cell_and_direction|
      if (cell = cell_and_direction.first) && !cell.visited?
        dirs << cell_and_direction.last
      end
      dirs
    end.sample
  end

  def klass
    k = []

    k << 'east'  if walls & EAST  > 0
    k << 'west'  if walls & WEST  > 0
    k << 'north' if walls & NORTH > 0
    k << 'south' if walls & SOUTH > 0

    if start?
      k << 'start'
    elsif end?
      k << 'end'
    end
    k.join(' ')
  end

  def start?
    x == grid.start_x && y == grid.start_y
  end

  def end?
    x == grid.end_x && y == grid.end_y
  end

  def connect_to(direction)

    case direction
    when EAST
      self.walls |= EAST
      east.walls |= WEST

      east
    when WEST
      self.walls |= WEST
      west.walls |= EAST

      west
    when NORTH
      self.walls  |= NORTH
      north.walls |= SOUTH

      north
    when SOUTH
      self.walls  |= SOUTH
      south.walls |= NORTH

      south
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

  attr_accessor :grid, :visited

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
