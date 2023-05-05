require_relative 'spec_utils'

describe Game do

  let(:genre) {double('genre', items: [])}
  let(:label) {double('label', items: [])}
  let(:author) {double('author', items: [])}
  let(:game) {Game.new([genre], [author], [label])}

  before do
    allow_any_instance_of(Game).to receive(:instance_selector).and_return(genre, author, label)
    allow_any_instance_of(Game).to receive(:is_multiplayer?).and_return(true)
    allow_any_instance_of(Game).to receive(:last_played_date_input).and_return(2020)
    allow_any_instance_of(Game).to receive(:publish_date_input).and_return(2010)
  end

  context 'when initialized' do

    it 'shows information about the game' do
      expect(game.genre).to eq genre
      expect(game.author).to eq author
      expect(game.label).to eq label
      expect(game.publish_date).to eq 2010
      expect(game.last_played_date).to eq 2020
      expect(game.archived).to eq false
      expect(game.multiplayer).to eq true
    end

    it 'Returns false for the game that cannot be archived' do
      expect(game.can_be_archived?).to eq true
    end
    it 'can be archived?' do
      game.move_to_archive
      expect(game.archived).to eq true
    end
  end
end
