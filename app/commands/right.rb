require_relative 'rotate'

class RightCommand
  def initialize(game)
    @game = game
  end

  def execute
    return false if @game.nil?
    return false if @game.robot.nil?

    rotate_command = RotateCommand.new(@game)
    rotate_command.execute('RIGHT')
  end
end
