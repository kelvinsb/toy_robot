require 'sinatra'
require 'json'
require './app/entities/games'
require './app/presentation/controllers/execute_commands'

games = nil

before do
  content_type :json
end

get '/' do
  { working: true }.to_json
end

post '/' do
  content_type :json
  the_params = JSON.parse(request.body.read)
  games ||= Games.new

  execute_commands(the_params, games)
end
