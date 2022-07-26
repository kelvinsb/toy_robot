require './app/entities/game'

RSpec.describe 'Game' do
  context '(WRONG) create' do
    it 'not integer' do
      dimension = 'something'

      expect { Game.new(dimension) }.to raise_error(ArgumentError, 'dimension must be integer')
    end

    it 'not positive(>0)' do
      dimension = 0

      expect { Game.new(dimension) }.to raise_error(ArgumentError, 'dimension must be positive')
    end
  end

  context 'right' do
    it 'create' do
      dimension = 5

      the_game = Game.new(dimension)

      expect(the_game.max_x_position).to eq(dimension)
      expect(the_game.max_y_position).to eq(dimension)
      expect(the_game.robot).to eq(nil)
    end
  end
end
