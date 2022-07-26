require './app/entities/game'
require './app/commands/place'
require './app/adaptors/facing'
require './spec/factories/position_factory'
require './spec/factories/facing_factory'

RSpec.describe 'Place' do
  context '(WRONG) execute' do
    it 'execute a second time' do
      dimension, position_x, position_y = dimension_and_positions_factory
      direction = generate_facing_command
      the_game = Game.new(dimension)
      command = PlaceCommand.new(the_game)

      command.execute(position_x, position_y, direction)
      command.execute(position_x + 1, position_y + 1, direction)

      expect(the_game.robot.position_x).to eq(position_x)
      expect(the_game.robot.position_y).to eq(position_y)
      expect(the_game.robot.facing).to eq(FACING[facing_adaptor_command_to_entity(direction).to_sym])
    end
  end

  context '(WRONG) x-axis' do
    it '(MAX) execute out of board' do
      dimension, _position_x, position_y = dimension_and_positions_factory
      direction = generate_facing_command
      the_game = Game.new(dimension)
      command = PlaceCommand.new(the_game)
      position_x = dimension + 1

      expect do
        command.execute(position_x, position_y, direction)
      end.to raise_error(StandardError, 'position_x is out of board')
    end

    it '(NEGATIVE) execute out of board' do
      dimension, _position_x, position_y = dimension_and_positions_factory
      direction = generate_facing_command
      the_game = Game.new(dimension)
      command = PlaceCommand.new(the_game)
      position_x = -1

      expect do
        command.execute(position_x, position_y, direction)
      end.to raise_error(StandardError, 'position_x must be positive')
    end
  end

  context '(WRONG) y-axis' do
    it '(MAX) execute out of board' do
      dimension, position_x, _position_y = dimension_and_positions_factory
      direction = generate_facing_command
      the_game = Game.new(dimension)
      command = PlaceCommand.new(the_game)
      position_y = dimension + 1

      expect do
        command.execute(position_x, position_y, direction)
      end.to raise_error(StandardError, 'position_y is out of board')
    end

    it '(NEGATIVE) execute out of board' do
      dimension, position_x, _position_y = dimension_and_positions_factory
      direction = generate_facing_command
      the_game = Game.new(dimension)
      command = PlaceCommand.new(the_game)
      position_y = -1

      expect do
        command.execute(position_x, position_y, direction)
      end.to raise_error(StandardError, 'position_y must be positive')
    end
  end

  context 'right' do
    it 'execute' do
      dimension, position_x, position_y = dimension_and_positions_factory
      direction = generate_facing_command
      the_game = Game.new(dimension)
      command = PlaceCommand.new(the_game)

      command.execute(position_x, position_y, direction)

      expect(the_game.robot.position_x).to eq(position_x)
      expect(the_game.robot.position_y).to eq(position_y)
      expect(the_game.robot.facing).to eq(FACING[facing_adaptor_command_to_entity(direction).to_sym])
    end
  end
end
