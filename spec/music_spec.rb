require_relative '../music/music'

require_relative '../lib/item'

describe Music do
  before :each do
    @music = Music.new(true)
  end

  it 'check if the music is on spotify' do
    expect(@music.on_spotify).to eq(true)
  end
end