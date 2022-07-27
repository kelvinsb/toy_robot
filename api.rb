require 'sinatra'
require 'sinatra/cors'
require 'json'
require './app/entities/games'
require './app/presentation/controllers/execute_commands'

games = nil
set :port, 4000
set :allow_origin, '*'
set :allow_methods, 'GET,HEAD,POST'
set :allow_headers, 'content-type,if-modified-since'
set :expose_headers, 'location,link'
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
