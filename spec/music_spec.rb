require_relative 'spec_utils'

describe MusicAlbum do
  let(:genre) { double('genre', items: []) }
  let(:label) { double('label', items: []) }
  let(:author) { double('author', items: []) }
  let(:music) { MusicAlbum.new([genre], [author], [label]) }

  before do
    allow_any_instance_of(MusicAlbum).to receive(:instance_selector).and_return(genre, author, label)
    allow_any_instance_of(MusicAlbum).to receive(:publish_date_input).and_return(2010)
  end

  context 'when initialized' do
    before do
      allow_any_instance_of(MusicAlbum).to receive(:on_spotify_input).and_return(true)
    end

    it 'shows information about the music' do
      expect(music.genre).to eq genre
      expect(music.author).to eq author
      expect(music.label).to eq label
      expect(music.publish_date).to eq 2010
      expect(music.on_spotify).to eq true
    end
    it 'can be archived' do
      music.move_to_archive
      expect(music.archived).to eq true
    end
  end

  context 'when initialized' do
    before do
      allow_any_instance_of(MusicAlbum).to receive(:on_spotify_input).and_return(false)
    end
    it 'can be archived' do
      music.move_to_archive
      expect(music.archived).to eq false
    end
  end
end
