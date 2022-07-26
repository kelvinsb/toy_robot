class Game
  attr_accessor :robot
  attr_reader :max_x_position, :max_y_position

  def initialize(dimension)
    raise ArgumentError, 'dimension must be integer' unless dimension.is_a? Integer
    raise ArgumentError, 'dimension must be positive' unless dimension.positive?

    @max_x_position = dimension
    @max_y_position = dimension
  end
end
