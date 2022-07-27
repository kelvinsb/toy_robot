require './app/entities/game'

DEFAULT_DIMENSION = 5

class Games
  attr_reader :games

  def initialize
    @games = []
  end

  def find_game(id)
    @games.detect { |current_game| current_game.id == id }
  end

  def create_game
    created_game = Game.new(DEFAULT_DIMENSION)
    @games << created_game
    created_game
  end
end
