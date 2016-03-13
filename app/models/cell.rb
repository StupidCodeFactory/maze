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

  private

  attr_accessor :x, :y, :walls

  def east
    [x - 1, y]
  end

  def west
    [x + 1, y]
  end

  def north
    [x, y - 1]
  end

  def south
    [x, y + 1]
  end
end
