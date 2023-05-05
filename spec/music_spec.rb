require_relative '../lib/music'

describe MusicAlbum do
  before :each do
    @music = MusicAlbum.new('Album Name', 'Artist Name', 'Genre', true)
  end

  it 'checks if the music is on spotify' do
    expect(@music.on_spotify).to eq(true)
  end
end
