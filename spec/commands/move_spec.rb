require './app/entities/robot'
require './app/entities/game'
require './app/commands/place'
require './app/commands/move'
require './app/adaptors/facing'

RSpec.describe 'Move command' do
  context 'move correctly' do
    it 'SOUTH' do
      dimension = 3
      position_x = 1
      position_y = 1
      direction = 'SOUTH'
      expected_position_x = position_x
      expected_position_y = position_y + 1

      the_game = Game.new(dimension)
      place_command = PlaceCommand.new(the_game)
      place_command.execute(position_x, position_y, direction)

      move_command = MoveCommand.new(the_game)
      move_command.execute

      expect(the_game.robot.position_x).to eq(expected_position_x)
      expect(the_game.robot.position_y).to eq(expected_position_y)
      expect(the_game.robot.facing).to eq(FACING[facing_adaptor_command_to_entity(direction).to_sym])
    end

    it 'NORTH' do
      dimension = 3
      position_x = 1
      position_y = 1
      direction = 'NORTH'
      expected_position_x = position_x
      expected_position_y = position_y - 1

      the_game = Game.new(dimension)
      place_command = PlaceCommand.new(the_game)
      place_command.execute(position_x, position_y, direction)

      move_command = MoveCommand.new(the_game)
      move_command.execute

      expect(the_game.robot.position_x).to eq(expected_position_x)
      expect(the_game.robot.position_y).to eq(expected_position_y)
      expect(the_game.robot.facing).to eq(FACING[facing_adaptor_command_to_entity(direction).to_sym])
    end

    it 'EAST' do
      dimension = 3
      position_x = 1
      position_y = 1
      direction = 'EAST'
      expected_position_x = position_x + 1
      expected_position_y = position_y

      the_game = Game.new(dimension)
      place_command = PlaceCommand.new(the_game)
      place_command.execute(position_x, position_y, direction)

      move_command = MoveCommand.new(the_game)
      move_command.execute

      expect(the_game.robot.position_x).to eq(expected_position_x)
      expect(the_game.robot.position_y).to eq(expected_position_y)
      expect(the_game.robot.facing).to eq(FACING[facing_adaptor_command_to_entity(direction).to_sym])
    end

    it 'WEST' do
      dimension = 3
      position_x = 1
      position_y = 1
      direction = 'WEST'
      expected_position_x = position_x - 1
      expected_position_y = position_y

      the_game = Game.new(dimension)
      place_command = PlaceCommand.new(the_game)
      place_command.execute(position_x, position_y, direction)

      move_command = MoveCommand.new(the_game)
      move_command.execute

      expect(the_game.robot.position_x).to eq(expected_position_x)
      expect(the_game.robot.position_y).to eq(expected_position_y)
      expect(the_game.robot.facing).to eq(FACING[facing_adaptor_command_to_entity(direction).to_sym])
    end
  end

  context 'do not move(edge)' do
    it 'SOUTH' do
      dimension = 3
      position_x = 1
      position_y = 2
      direction = 'SOUTH'
      expected_position_x = position_x
      expected_position_y = position_y

      the_game = Game.new(dimension)
      place_command = PlaceCommand.new(the_game)
      place_command.execute(position_x, position_y, direction)

      move_command = MoveCommand.new(the_game)
      move_command.execute

      expect(the_game.robot.position_x).to eq(expected_position_x)
      expect(the_game.robot.position_y).to eq(expected_position_y)
      expect(the_game.robot.facing).to eq(FACING[facing_adaptor_command_to_entity(direction).to_sym])
    end

    it 'NORTH' do
      dimension = 3
      position_x = 1
      position_y = 0
      direction = 'NORTH'
      expected_position_x = position_x
      expected_position_y = position_y

      the_game = Game.new(dimension)
      place_command = PlaceCommand.new(the_game)
      place_command.execute(position_x, position_y, direction)

      move_command = MoveCommand.new(the_game)
      move_command.execute

      expect(the_game.robot.position_x).to eq(expected_position_x)
      expect(the_game.robot.position_y).to eq(expected_position_y)
      expect(the_game.robot.facing).to eq(FACING[facing_adaptor_command_to_entity(direction).to_sym])
    end

    it 'EAST' do
      dimension = 3
      position_x = 2
      position_y = 1
      direction = 'EAST'
      expected_position_x = position_x
      expected_position_y = position_y

      the_game = Game.new(dimension)
      place_command = PlaceCommand.new(the_game)
      place_command.execute(position_x, position_y, direction)

      move_command = MoveCommand.new(the_game)
      move_command.execute

      expect(the_game.robot.position_x).to eq(expected_position_x)
      expect(the_game.robot.position_y).to eq(expected_position_y)
      expect(the_game.robot.facing).to eq(FACING[facing_adaptor_command_to_entity(direction).to_sym])
    end

    it 'WEST' do
      dimension = 3
      position_x = 0
      position_y = 1
      direction = 'WEST'
      expected_position_x = position_x
      expected_position_y = position_y

      the_game = Game.new(dimension)
      place_command = PlaceCommand.new(the_game)
      place_command.execute(position_x, position_y, direction)

      move_command = MoveCommand.new(the_game)
      move_command.execute

      expect(the_game.robot.position_x).to eq(expected_position_x)
      expect(the_game.robot.position_y).to eq(expected_position_y)
      expect(the_game.robot.facing).to eq(FACING[facing_adaptor_command_to_entity(direction).to_sym])
    end
  end

  context 'without previous step' do
    it '(WRONG) trying to move without previous place command' do
      dimension = 3

      the_game = Game.new(dimension)

      move_command = MoveCommand.new(the_game)
      move_command.execute

      expect(the_game.robot).to eq(nil)
    end
  end
end
