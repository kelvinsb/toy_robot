class RotateCommand
  def initialize(game)
    @game = game
  end

  def execute(side)
    return false if @game.nil?
    return false if @game.robot.nil?

    the_count = side == 'RIGHT' ? 1 : -1
    @game.robot.facing = get_new_facing(@game.robot.facing + the_count)
    @game
  end

  def get_new_facing(facing)
    facing % 4
  end
end
