class Amaze

  def initialize(width, height)
    self.width  = width
    self.height = height

    self.start_x = rand(width)
    self.start_y = 0

    self.grid  = Array.new(width) { |y| Array.new(height) { |x| Cell.new(x,y)} }
  end

  def generate
    visit_cell(start_x, start_y)
  end

  private

  attr_accessor :width, :height, :start_x, :start_y, :grid

end
