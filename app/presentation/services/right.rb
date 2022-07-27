require './app/commands/right'
require './app/presentation/utils'

def right_service(id, command, games)
  raise ArgumentError, 'id required' unless id

  game_finded = games.find_game(id)
  return {} if game_finded.nil?

  result_command = right_command(command, game_finded)
  return {} if result_command.nil?

  format_output(result_command)
end
