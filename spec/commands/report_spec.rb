require './app/entities/game'
require './app/commands/place'
require './app/commands/report'
require './spec/factories/position_factory'
require './spec/factories/facing_factory'

RSpec.describe 'Report command' do
  context 'not executed place command' do
    it 'wrong' do
      dimension, _position_x, _position_y = dimension_and_positions_factory
      the_game = Game.new(dimension)

      report_command = ReportCommand.new(the_game)
      report_executed = report_command.execute

      expect(report_executed).to eq('')
      expect(the_game.robot).to eq(nil)
    end
  end

  context 'right' do
    it 'report' do
      dimension, position_x, position_y = dimension_and_positions_factory
      direction = 'NORTH'
      the_game = Game.new(dimension)
      place_command = PlaceCommand.new(the_game)

      place_command.execute(position_x, position_y, direction)
      place_command.execute(position_x + 1, position_y + 1, direction)

      report_command = ReportCommand.new(the_game)
      current_x, current_y, current_facing = report_command.execute.split(',')
      inverted_facing = FACING.invert
      expect_facing = facing_adaptor_entity_to_command(inverted_facing[current_facing.to_i])
      expected_facing = facing_adaptor_entity_to_command(inverted_facing[(the_game.robot.facing)])

      expect(current_x).to eq(the_game.robot.position_x.to_s)
      expect(current_y).to eq(the_game.robot.position_y.to_s)
      expect(expect_facing).to eq(expected_facing)
    end
  end
end
