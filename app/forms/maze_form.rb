class MazeForm
  include ActiveModel::Model

  validates_numericality_of :height, :width, greater_than: 4

  attr_accessor :height, :width

  def save
    return false unless valid?
    maze_generator.generate
    maze.persisted?
  end

  def maze
    @maze ||= MazeBoard.create_from_amaze(maze_generator)
  end

  private

  def maze_generator
    @maze_generator ||= Amaze.new(width, height)
  end

end
