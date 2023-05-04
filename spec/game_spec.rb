require_relative 'spec_utils'

describe Game do
  context 'create a game and test their methods, for a game that cannot be archived' do
    game = Game.new('Action', 'John', 'Steam', 'EA', 2019, 2020)

    it 'shows information about the game' do
      expect(game.genre).to eq 'Action'
      expect(game.author).to eq 'John'
      expect(game.source).to eq 'Steam'
      expect(game.label).to eq 'EA'
      expect(game.publish_date).to eq 2019
      expect(game.last_played_date).to eq 2020
      expect(game.archived).to eq false
      expect(game.multiplayer).to eq false
    end

    it 'Returns false for the game that cannot be archived' do
      expect(game.can_be_archived?).to eq false
    end
  end

  context 'create a game and test their methods, for a game that can be archived' do
    game = Game.new('Action', 'John', 'Steam', 'EA', 2000, 2018)

    it 'Returns true for a game that can be archived' do
      expect(game.can_be_archived?).to eq true
    end

    it 'can be archived?' do
      game.move_to_archive
      expect(game.archived).to eq true
    end
  end
end
