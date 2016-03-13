class Amaze


  0x1111

  def initialize(width, height)
    self.width  = width
    self.height = height

    self.start_x = rand(width)
    self.start_y = 0
  end

  def rows
  end

  private

  attr_accessor :width, :height
end
