require './app/presentation/services/place'
require './app/presentation/services/move'
require './app/presentation/services/left'
require './app/presentation/services/right'
require './app/presentation/services/report'

def switch_commands(id, command, arguments, games)
  raise StandardError, 'command required' unless command

  case command
  when 'PLACE'
    place_service(command, arguments, games)
  when 'MOVE'
    move_service(id, command, games)
  when 'LEFT'
    left_service(id, command, games)
  when 'RIGHT'
    right_service(id, command, games)
  else
    report_service(id, command, games)
  end
end

def execute_commands(the_params, games)
  command = the_params['command']
  arguments = the_params['arguments']
  id = the_params['id']

  switch_commands(id, command, arguments, games).to_json
rescue ArgumentError, StandardError => e
  # puts e
  # puts e.backtrace
  status(422)
  { message: e.message }.to_json
end
