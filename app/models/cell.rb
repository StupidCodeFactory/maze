class Cell

  EAST  = 1
  WEST  = 2
  NORTH = 4
  SOUTH = 8

  def initialize(x,y)
    self.x = x
    self.y = y
    self.walls = 0x1111
  end

  def neighbours
    [east, west, north, south]
  end

  def connect_to(direction)
    case direction
    when EAST
    when WEST
    when NORTH
    when SOUTH
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
