require './app/commands/report'
require './app/presentation/utils'

def report_service(id, command, games)
  raise ArgumentError, 'id required' unless id

  game_found = games.find_game(id)
  return {} if game_found.nil?

  result_command = report_command(command, game_found)
  return {} if result_command.empty?

  position_x, position_y, facing = result_command.split(',')
  simple_output(id, position_x, position_y, facing)
end
