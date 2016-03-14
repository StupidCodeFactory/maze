class MazeForm
  include ActiveModel::Model

  validates_numericality_of :height, :width, greater_than: 4

  attr_accessor :height, :width
end
