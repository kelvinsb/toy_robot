class MoveCommand
  def initialize(game)
    @game = game
  end

  def execute
    return false if @game.nil?
    return false if @game.robot.nil?

    position_x, position_y = get_positions(@game.robot.position_x, @game.robot.position_y, @game.robot.facing,
                                           @game.max_x_position, @game.max_y_position)
    @game.robot.position_x = position_x unless position_x.nil?
    @game.robot.position_y = position_y unless position_y.nil?
    @game
  end

  private

  def get_positions(position_x, position_y, direction, max_position_x, max_position_y)
    [get_position_x(position_x, direction, max_position_x), get_position_y(position_y, direction, max_position_y)]
  end

  def get_position_x(position_x, direction, max_position_x)
    new_position_x = nil
    new_position_x = position_x + 1 if direction == 1
    new_position_x = position_x - 1 if direction == 3

    return nil if new_position_x.nil?
    return new_position_x if new_position_x >= 0 && new_position_x < max_position_x

    nil
  end

  def get_position_y(position_y, direction, max_position_y)
    new_position_y = nil
    new_position_y = position_y + 1 if direction == 2
    new_position_y = position_y - 1 if direction == 0

    return nil if new_position_y.nil?
    return new_position_y if new_position_y >= 0 && new_position_y < max_position_y

    nil
  end
end
