class Cell

  EAST  = 0b0001
  WEST  = 0b0010
  NORTH = 0b0100
  SOUTH = 0b1000

  def initialize(x,y)
    self.x     = x
    self.y     = y
    self.walls = 0b000
  end

  def neighbours
    [east, west, north, south]
  end

  def connect_to(direction)
    raise ArgumentError.new("Cell (#{x}, #{y}) already connected") if walls > 0
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

  def to_a
    [x, y]
  end
  private

  attr_accessor :x, :y, :walls

  def east
    @east ||= Cell.new(*east_coordinates)
  end

  def west
    @west ||= Cell.new(*west_coordinates)
  end

  def north
    @north ||= Cell.new(*north_coordinates)
  end

  def south
    @south ||= Cell.new(*south_coordinates)
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
