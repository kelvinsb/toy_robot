require './app/entities/robot'
require './app/adaptors/facing'

class PlaceCommand
  def initialize(game)
    @game = game
  end

  def execute(position_x, position_y, facing)
    return false if @game.nil?
    return false if @game.robot
    raise StandardError, 'position_x is out of board' if position_x > @game.max_x_position
    raise StandardError, 'position_y is out of board' if position_y > @game.max_y_position

    facing_converted = facing_adaptor_command_to_entity(facing)

    @game.robot = Robot.new(position_x, position_y, facing_converted)
    @game = nil
  end
end
