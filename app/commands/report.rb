class ReportCommand
  def initialize(game)
    @game = game
  end

  def execute
    return '' if @game.nil?
    return '' if @game.robot.nil?

    facing = facing_adaptor_entity_to_command(FACING.invert[@game.robot.facing])
    report_values = [@game.robot.position_x, @game.robot.position_y, facing]
    report_values.join(',')
  end
end
