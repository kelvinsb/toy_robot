require_relative 'rotate'

class LeftCommand
  def initialize(game)
    @game = game
  end

  def execute
    return false if @game.nil?
    return false if @game.robot.nil?

    rotate_command = RotateCommand.new(@game)
    rotate_command.execute('LEFT')
  end
end
