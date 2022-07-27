def place_command(command, arguments, game)
  return false unless command == 'PLACE'
  return false unless arguments

  the_arguments = arguments.split(',')
  return false if the_arguments.length != 3

  position_x, position_y, direction = the_arguments

  the_command = PlaceCommand.new(game)
  the_command.execute(position_x.to_i, position_y.to_i, direction)

  game
end

def move_command(command, game)
  return false unless command == 'MOVE'

  the_command = MoveCommand.new(game)
  the_command.execute
end

def left_command(command, game)
  return false unless command == 'LEFT'

  the_command = LeftCommand.new(game)
  the_command.execute
end

def right_command(command, game)
  return false unless command == 'RIGHT'

  the_command = RightCommand.new(game)
  the_command.execute
end

def report_command(_command, game)
  the_command = ReportCommand.new(game)
  the_command.execute
end

def format_output(game)
  robot = game.robot
  facing_value = facing_adaptor_entity_to_command(FACING.invert[robot.facing])

  simple_output(game.id, robot.position_x, robot.position_y, facing_value)
end

def simple_output(id, position_x, position_y, facing_value)
  { game_id: id, position_x: position_x, position_y: position_y,
    facing: facing_value }
end
