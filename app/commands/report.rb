class ReportCommand
  def initialize(game)
    @game = game
  end

  def execute
    return false if @game.nil?
    return false if @game.robot.nil?

    something = [@game.robot.position_x, @game.robot.position_y, @game.robot.facing]
    something.join(',')
  end
end
