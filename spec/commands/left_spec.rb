require './app/entities/game'
require './app/commands/place'
require './app/commands/left'
require './app/adaptors/facing'
require './spec/factories/position_factory'
require './spec/factories/facing_factory'

RSpec.describe 'Left command' do
  context 'not executed place command' do
    it 'wrong' do
      dimension, _position_x, _position_y = dimension_and_positions_factory
      the_game = Game.new(dimension)

      left_command = LeftCommand.new(the_game)
      left_command.execute

      expect(the_game.robot).to eq(nil)
    end
  end

  context 'rotate to left' do
    it 'NORTH -> WEST' do
      dimension, position_x, position_y = dimension_and_positions_factory
      direction = 'NORTH'
      the_game = Game.new(dimension)
      place_command = PlaceCommand.new(the_game)
      expected_direction = 'WEST'

      place_command.execute(position_x, position_y, direction)
      place_command.execute(position_x + 1, position_y + 1, direction)

      left_command = LeftCommand.new(the_game)
      left_command.execute

      expect(the_game.robot.position_x).to eq(position_x)
      expect(the_game.robot.position_y).to eq(position_y)
      expect(the_game.robot.facing).to eq(FACING[facing_adaptor_command_to_entity(expected_direction).to_sym])
    end

    it 'WEST -> SOUTH' do
      dimension, position_x, position_y = dimension_and_positions_factory
      direction = 'WEST'
      the_game = Game.new(dimension)
      place_command = PlaceCommand.new(the_game)
      expected_direction = 'SOUTH'

      place_command.execute(position_x, position_y, direction)
      place_command.execute(position_x + 1, position_y + 1, direction)

      left_command = LeftCommand.new(the_game)
      left_command.execute

      expect(the_game.robot.position_x).to eq(position_x)
      expect(the_game.robot.position_y).to eq(position_y)
      expect(the_game.robot.facing).to eq(FACING[facing_adaptor_command_to_entity(expected_direction).to_sym])
    end

    it 'SOUTH -> EAST' do
      dimension, position_x, position_y = dimension_and_positions_factory
      direction = 'SOUTH'
      the_game = Game.new(dimension)
      place_command = PlaceCommand.new(the_game)
      expected_direction = 'EAST'

      place_command.execute(position_x, position_y, direction)
      place_command.execute(position_x + 1, position_y + 1, direction)

      left_command = LeftCommand.new(the_game)
      left_command.execute

      expect(the_game.robot.position_x).to eq(position_x)
      expect(the_game.robot.position_y).to eq(position_y)
      expect(the_game.robot.facing).to eq(FACING[facing_adaptor_command_to_entity(expected_direction).to_sym])
    end

    it 'EAST -> NORTH' do
      dimension, position_x, position_y = dimension_and_positions_factory
      direction = 'EAST'
      the_game = Game.new(dimension)
      place_command = PlaceCommand.new(the_game)
      expected_direction = 'NORTH'

      place_command.execute(position_x, position_y, direction)
      place_command.execute(position_x + 1, position_y + 1, direction)

      left_command = LeftCommand.new(the_game)
      left_command.execute

      expect(the_game.robot.position_x).to eq(position_x)
      expect(the_game.robot.position_y).to eq(position_y)
      expect(the_game.robot.facing).to eq(FACING[facing_adaptor_command_to_entity(expected_direction).to_sym])
    end
  end
end
